//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.effect.lighting
{
    import flash.display.Sprite;
    import flash.display.BitmapData;
    import flash.filters.GlowFilter;
    import flash.utils.Timer;
    import flash.geom.Point;
    import flash.events.TimerEvent;
    import flash.geom.Matrix;

    public class Lightning extends Sprite 
    {

        private const SMOOTH_COLOR:uint = 0x808080;

        private var holder:Sprite;
        private var sbd:BitmapData;
        private var bbd:BitmapData;
        private var soffs:Array;
        private var boffs:Array;
        private var glow:GlowFilter;
        public var lifeSpan:Number;
        private var lifeTimer:Timer;
        public var startX:Number;
        public var startY:Number;
        public var endX:Number;
        public var endY:Number;
        public var len:Number;
        public var multi:Number;
        public var multi2:Number;
        public var _steps:uint;
        public var stepEvery:Number;
        private var seed1:uint;
        private var seed2:uint;
        public var smooth:Sprite;
        public var childrenSmooth:Sprite;
        public var childrenArray:Array;
        public var _smoothPercentage:uint = 50;
        public var _childrenSmoothPercentage:uint;
        public var _color:uint;
        private var generation:uint;
        private var _childrenMaxGenerations:uint = 3;
        private var _childrenProbability:Number = 0.025;
        private var _childrenProbabilityDecay:Number = 0;
        private var _childrenMaxCount:uint = 4;
        private var _childrenMaxCountDecay:Number = 0.5;
        private var _childrenLengthDecay:Number = 0;
        private var _childrenAngleVariation:Number = 60;
        private var _childrenLifeSpanMin:Number = 0;
        private var _childrenLifeSpanMax:Number = 0;
        private var _childrenDetachedEnd:Boolean = false;
        private var _maxLength:Number = 0;
        private var _maxLengthVary:Number = 0;
        public var _isVisible:Boolean = true;
        public var _alphaFade:Boolean = true;
        public var parentInstance:Lightning;
        private var _thickness:Number;
        private var _thicknessDecay:Number;
        private var initialized:Boolean = false;
        private var _wavelength:Number = 0.3;
        private var _amplitude:Number = 0.5;
        private var _speed:Number = 1;
        private var calculatedWavelength:Number;
        private var calculatedSpeed:Number;
        public var alphaFadeType:String;
        public var thicknessFadeType:String;
        private var position:Number = 0;
        private var absolutePosition:Number = 1;
        private var dx:Number;
        private var dy:Number;
        private var soff:Number;
        private var soffx:Number;
        private var soffy:Number;
        private var boff:Number;
        private var boffx:Number;
        private var boffy:Number;
        private var angle:Number;
        private var tx:Number;
        private var ty:Number;

        public function Lightning(pcolor:uint=0xFFFFFF, pthickness:Number=2, pgeneration:uint=0)
        {
            childrenArray = [];
            super();
            mouseEnabled = false;
            _color = pcolor;
            _thickness = pthickness;
            alphaFadeType = "generation";
            thicknessFadeType = "none";
            generation = pgeneration;
            if (generation == 0)
            {
                init();
            };
        }

        private function init():void
        {
            randomizeSeeds();
            if (lifeSpan > 0)
            {
                startLifeTimer();
            };
            multi2 = 0.03;
            holder = new Sprite();
            holder.mouseEnabled = false;
            startX = 50;
            startY = 200;
            endX = 50;
            endY = 600;
            stepEvery = 4;
            _steps = 50;
            sbd = new BitmapData(_steps, 1, false);
            bbd = new BitmapData(_steps, 1, false);
            soffs = [new Point(0, 0), new Point(0, 0)];
            boffs = [new Point(0, 0), new Point(0, 0)];
            if ((generation == 0))
            {
                smooth = new Sprite();
                childrenSmooth = new Sprite();
                smoothPercentage = 50;
                childrenSmoothPercentage = 50;
            }
            else
            {
                childrenSmooth = parentInstance.childrenSmooth;
                smooth = parentInstance.childrenSmooth;
            };
            steps = 100;
            childrenLengthDecay = 0.5;
            addChild(holder);
            initialized = true;
        }

        private function randomizeSeeds():void
        {
            seed1 = (Math.random() * 100);
            seed2 = (Math.random() * 100);
        }

        public function set steps(arg:uint):void
        {
            if (arg < 2)
            {
                arg = 2;
            };
            if (arg > 2880)
            {
                arg = 2880;
            };
            _steps = arg;
            sbd = new BitmapData(_steps, 1, false);
            bbd = new BitmapData(_steps, 1, false);
            if (generation == 0)
            {
                smoothPercentage = smoothPercentage;
            };
        }

        public function get steps():uint
        {
            return (_steps);
        }

        public function startLifeTimer():void
        {
            lifeTimer = new Timer((lifeSpan * 1000), 1);
            lifeTimer.start();
            lifeTimer.addEventListener("timer", onTimer);
        }

        private function onTimer(event:TimerEvent):void
        {
            kill();
        }

        public function kill():void
        {
            var count:int;
            var par = null;
            killAllChildren();
            if (lifeTimer)
            {
                lifeTimer.removeEventListener("timer", kill);
                lifeTimer.stop();
            };
            if (parentInstance != null)
            {
                count = 0;
                par = (this.parent as Lightning);
                for each (var obj:Object in par.childrenArray)
                {
                    if (obj.instance == this)
                    {
                        par.childrenArray.splice(count, 1);
                    };
                    count++;
                };
            };
            if (this.parent)
            {
                this.parent.removeChild(this);
            };
        }

        public function killAllChildren():void
        {
            var child = null;
            while (childrenArray.length > 0)
            {
                child = childrenArray[0].instance;
                child.kill();
            };
        }

        public function generateChild(n:uint=1, recursive:Boolean=false):void
        {
            var targetChildSteps:int;
            var i:int;
            var startStep:int;
            var endStep:int;
            var childAngle:Number;
            var child = null;
            if ((((generation < childrenMaxGenerations)) && ((childrenArray.length < childrenMaxCount))))
            {
                targetChildSteps = (steps * childrenLengthDecay);
                if (targetChildSteps >= 2)
                {
                    i = 0;
                    while (i < n)
                    {
                        startStep = (Math.random() * steps);
                        endStep = (Math.random() * steps);
                        while (endStep == startStep)
                        {
                            endStep = (Math.random() * steps);
                        };
                        childAngle = ((Math.random() * childrenAngleVariation) - (childrenAngleVariation / 2));
                        child = new Lightning(color, thickness, (generation + 1));
                        child.parentInstance = this;
                        child.lifeSpan = ((Math.random() * (childrenLifeSpanMax - childrenLifeSpanMin)) + childrenLifeSpanMin);
                        child.position = (1 - (startStep / steps));
                        child.absolutePosition = (absolutePosition * child.position);
                        child.alphaFadeType = alphaFadeType;
                        child.thicknessFadeType = thicknessFadeType;
                        if (alphaFadeType == "generation")
                        {
                            child.alpha = (1 - ((1 / (childrenMaxGenerations + 1)) * child.generation));
                        };
                        if (thicknessFadeType == "generation")
                        {
                            child.thickness = (thickness - ((thickness / (childrenMaxGenerations + 1)) * child.generation));
                        };
                        child.childrenMaxGenerations = childrenMaxGenerations;
                        child.childrenMaxCount = (childrenMaxCount * (1 - childrenMaxCountDecay));
                        child.childrenProbability = (childrenProbability * (1 - childrenProbabilityDecay));
                        child.childrenProbabilityDecay = childrenProbabilityDecay;
                        child.childrenLengthDecay = childrenLengthDecay;
                        child.childrenDetachedEnd = childrenDetachedEnd;
                        child.wavelength = wavelength;
                        child.amplitude = amplitude;
                        child.speed = speed;
                        child.init();
                        childrenArray.push({
                            "instance":child,
                            "startStep":startStep,
                            "endStep":endStep,
                            "detachedEnd":childrenDetachedEnd,
                            "childAngle":childAngle
                        });
                        addChild(child);
                        child.steps = (steps * (1 - childrenLengthDecay));
                        if (recursive)
                        {
                            child.generateChild(n, true);
                        };
                        i++;
                    };
                };
            };
        }

        public function update():void
        {
            var drawMatrix = null;
            var isVisibleProbability:Number;
            var generateChildRandom:Number;
            var childObject = null;
            if (initialized)
            {
                dx = (endX - startX);
                dy = (endY - startY);
                len = Math.sqrt(((dx * dx) + (dy * dy)));
                soffs[0].x = (soffs[0].x + ((steps / 100) * speed));
                soffs[0].y = (soffs[0].y + ((steps / 100) * speed));
                sbd.perlinNoise((steps / 20), (steps / 20), 1, seed1, false, true, 7, true, soffs);
                calculatedWavelength = (steps * wavelength);
                calculatedSpeed = ((calculatedWavelength * 0.1) * speed);
                boffs[0].x = (boffs[0].x - calculatedSpeed);
                boffs[0].y = (boffs[0].y + calculatedSpeed);
                bbd.perlinNoise(calculatedWavelength, calculatedWavelength, 1, seed2, false, true, 7, true, boffs);
                if (smoothPercentage > 0)
                {
                    drawMatrix = new Matrix();
                    drawMatrix.scale((steps / smooth.width), 1);
                    bbd.draw(smooth, drawMatrix);
                };
                if (!((parentInstance == null)))
                {
                    isVisible = parentInstance.isVisible;
                }
                else
                {
                    if ((maxLength == 0))
                    {
                        isVisible = true;
                    }
                    else
                    {
                        if ((len <= maxLength))
                        {
                            isVisibleProbability = 1;
                        }
                        else
                        {
                            if (len > (maxLength + maxLengthVary))
                            {
                                isVisibleProbability = 0;
                            }
                            else
                            {
                                isVisibleProbability = (1 - ((len - maxLength) / maxLengthVary));
                            };
                        };
                        isVisible = (((Math.random())<isVisibleProbability) ? true : false);
                    };
                };
                generateChildRandom = Math.random();
                if (generateChildRandom < childrenProbability)
                {
                    generateChild();
                };
                if (isVisible)
                {
                    render();
                };
                for each (childObject in childrenArray)
                {
                    childObject.instance.update();
                };
            };
        }

        public function render():void
        {
            var childObject = null;
            var i:int;
            var currentPosition:Number;
            var relAlpha:Number;
            var relThickness:Number;
            var arad:Number;
            var childLength:Number;
            holder.graphics.clear();
            holder.graphics.lineStyle(thickness, _color);
            angle = Math.atan2((endY - startY), (endX - startX));
            i = 0;
            while (i < steps)
            {
                currentPosition = ((1 / steps) * (steps - i));
                relAlpha = 1;
                relThickness = thickness;
                if (alphaFadeType == "tip")
                {
                    relAlpha = (absolutePosition * currentPosition);
                };
                if (thicknessFadeType == "tip")
                {
                    relThickness = (thickness * (absolutePosition * currentPosition));
                };
                if ((((alphaFadeType == "tip")) || ((thicknessFadeType == "tip"))))
                {
                    holder.graphics.lineStyle(relThickness, _color, relAlpha);
                };
                soff = ((((sbd.getPixel(i, 0) - 0x808080) / 0xFFFFFF) * len) * multi2);
                soffx = (Math.sin(angle) * soff);
                soffy = (Math.cos(angle) * soff);
                boff = ((((bbd.getPixel(i, 0) - 0x808080) / 0xFFFFFF) * len) * amplitude);
                boffx = (Math.sin(angle) * boff);
                boffy = (Math.cos(angle) * boff);
                tx = (((startX + ((dx / (steps - 1)) * i)) + soffx) + boffx);
                ty = (((startY + ((dy / (steps - 1)) * i)) - soffy) - boffy);
                if (i == 0)
                {
                    holder.graphics.moveTo(tx, ty);
                };
                holder.graphics.lineTo(tx, ty);
                for each (childObject in childrenArray)
                {
                    if (childObject.startStep == i)
                    {
                        childObject.instance.startX = tx;
                        childObject.instance.startY = ty;
                    };
                    if (childObject.detachedEnd)
                    {
                        arad = (angle + ((childObject.childAngle / 180) * 3.14159265358979));
                        childLength = (len * childrenLengthDecay);
                        childObject.instance.endX = (childObject.instance.startX + (Math.cos(arad) * childLength));
                        childObject.instance.endY = (childObject.instance.startY + (Math.sin(arad) * childLength));
                    }
                    else
                    {
                        if (childObject.endStep == i)
                        {
                            childObject.instance.endX = tx;
                            childObject.instance.endY = ty;
                        };
                    };
                };
                i++;
            };
        }

        public function killSurplus():void
        {
            var child = null;
            while (childrenArray.length > childrenMaxCount)
            {
                child = childrenArray[(childrenArray.length - 1)].instance;
                child.kill();
            };
        }

        public function set smoothPercentage(arg:Number):void
        {
            var smoothmatrix = null;
            var ratioOffset:int;
            if (smooth)
            {
                _smoothPercentage = arg;
                smoothmatrix = new Matrix();
                smoothmatrix.createGradientBox(steps, 1);
                ratioOffset = ((_smoothPercentage / 100) * 128);
                smooth.graphics.clear();
                smooth.graphics.beginGradientFill("linear", [0x808080, 0x808080, 0x808080, 0x808080], [1, 0, 0, 1], [0, ratioOffset, (0xFF - ratioOffset), 0xFF], smoothmatrix);
                smooth.graphics.drawRect(0, 0, steps, 1);
                smooth.graphics.endFill();
            };
        }

        public function set childrenSmoothPercentage(arg:Number):void
        {
            _childrenSmoothPercentage = arg;
            var smoothmatrix:Matrix = new Matrix();
            smoothmatrix.createGradientBox(steps, 1);
            var ratioOffset:uint = ((_childrenSmoothPercentage / 100) * 128);
            childrenSmooth.graphics.clear();
            childrenSmooth.graphics.beginGradientFill("linear", [0x808080, 0x808080, 0x808080, 0x808080], [1, 0, 0, 1], [0, ratioOffset, (0xFF - ratioOffset), 0xFF], smoothmatrix);
            childrenSmooth.graphics.drawRect(0, 0, steps, 1);
            childrenSmooth.graphics.endFill();
        }

        public function get smoothPercentage():Number
        {
            return (_smoothPercentage);
        }

        public function get childrenSmoothPercentage():Number
        {
            return (_childrenSmoothPercentage);
        }

        public function set color(arg:uint):void
        {
            _color = arg;
            glow.color = arg;
            holder.filters = [glow];
            for each (var child:Object in childrenArray)
            {
                child.instance.color = arg;
            };
        }

        public function get color():uint
        {
            return (_color);
        }

        public function set childrenProbability(arg:Number):void
        {
            if (arg > 1)
            {
                arg = 1;
            }
            else
            {
                if (arg < 0)
                {
                    arg = 0;
                };
            };
            _childrenProbability = arg;
        }

        public function get childrenProbability():Number
        {
            return (_childrenProbability);
        }

        public function set childrenProbabilityDecay(arg:Number):void
        {
            if (arg > 1)
            {
                arg = 1;
            }
            else
            {
                if (arg < 0)
                {
                    arg = 0;
                };
            };
            _childrenProbabilityDecay = arg;
        }

        public function get childrenProbabilityDecay():Number
        {
            return (_childrenProbabilityDecay);
        }

        public function set maxLength(arg:Number):void
        {
            _maxLength = arg;
        }

        public function get maxLength():Number
        {
            return (_maxLength);
        }

        public function set maxLengthVary(arg:Number):void
        {
            _maxLengthVary = arg;
        }

        public function get maxLengthVary():Number
        {
            return (_maxLengthVary);
        }

        public function set thickness(arg:Number):void
        {
            if (arg < 0)
            {
                arg = 0;
            };
            _thickness = arg;
        }

        public function get thickness():Number
        {
            return (_thickness);
        }

        public function set thicknessDecay(arg:Number):void
        {
            if (arg > 1)
            {
                arg = 1;
            }
            else
            {
                if (arg < 0)
                {
                    arg = 0;
                };
            };
            _thicknessDecay = arg;
        }

        public function get thicknessDecay():Number
        {
            return (_thicknessDecay);
        }

        public function set childrenLengthDecay(arg:Number):void
        {
            if (arg > 1)
            {
                arg = 1;
            }
            else
            {
                if (arg < 0)
                {
                    arg = 0;
                };
            };
            _childrenLengthDecay = arg;
        }

        public function get childrenLengthDecay():Number
        {
            return (_childrenLengthDecay);
        }

        public function set childrenMaxGenerations(arg:uint):void
        {
            _childrenMaxGenerations = arg;
            killSurplus();
        }

        public function get childrenMaxGenerations():uint
        {
            return (_childrenMaxGenerations);
        }

        public function set childrenMaxCount(arg:uint):void
        {
            _childrenMaxCount = arg;
            killSurplus();
        }

        public function get childrenMaxCount():uint
        {
            return (_childrenMaxCount);
        }

        public function set childrenMaxCountDecay(arg:Number):void
        {
            if (arg > 1)
            {
                arg = 1;
            }
            else
            {
                if (arg < 0)
                {
                    arg = 0;
                };
            };
            _childrenMaxCountDecay = arg;
        }

        public function get childrenMaxCountDecay():Number
        {
            return (_childrenMaxCountDecay);
        }

        public function set childrenAngleVariation(arg:Number):void
        {
            _childrenAngleVariation = arg;
            for each (var o:Object in childrenArray)
            {
                o.childAngle = ((Math.random() * arg) - (arg / 2));
                o.instance.childrenAngleVariation = arg;
            };
        }

        public function get childrenAngleVariation():Number
        {
            return (_childrenAngleVariation);
        }

        public function set childrenLifeSpanMin(arg:Number):void
        {
            _childrenLifeSpanMin = arg;
        }

        public function get childrenLifeSpanMin():Number
        {
            return (_childrenLifeSpanMin);
        }

        public function set childrenLifeSpanMax(arg:Number):void
        {
            _childrenLifeSpanMax = arg;
        }

        public function get childrenLifeSpanMax():Number
        {
            return (_childrenLifeSpanMax);
        }

        public function set childrenDetachedEnd(arg:Boolean):void
        {
            _childrenDetachedEnd = arg;
        }

        public function get childrenDetachedEnd():Boolean
        {
            return (_childrenDetachedEnd);
        }

        public function set wavelength(arg:Number):void
        {
            _wavelength = arg;
            for each (var o:Object in childrenArray)
            {
                o.instance.wavelength = arg;
            };
        }

        public function get wavelength():Number
        {
            return (_wavelength);
        }

        public function set amplitude(arg:Number):void
        {
            _amplitude = arg;
            for each (var o:Object in childrenArray)
            {
                o.instance.amplitude = arg;
            };
        }

        public function get amplitude():Number
        {
            return (_amplitude);
        }

        public function set speed(arg:Number):void
        {
            _speed = arg;
            for each (var o:Object in childrenArray)
            {
                o.instance.speed = arg;
            };
        }

        public function get speed():Number
        {
            return (_speed);
        }

        public function set isVisible(arg:Boolean):void
        {
            visible = arg;
            _isVisible = arg;
        }

        public function get isVisible():Boolean
        {
            return (_isVisible);
        }


    }
}//package com.game.mainCore.core.effect.lighting
