package away3d.ribbon
{
    import away3d.containers.ObjectContainer3D;
    import __AS3__.vec.Vector;
    import flash.geom.Vector3D;
    import away3d.primitives.PlaneGeometry;
    import away3d.core.base.Geometry;
    import away3d.materials.MaterialBase;
    import away3d.containers.Scene3D;
    import flash.utils.ByteArray;
    import away3d.core.base.CompactSubGeometry;
    import away3d.core.base.Object3D;

    public class SinglePointRibbon extends RibbonBase 
    {

        protected var _target:ObjectContainer3D;
        private var _positions1:Vector.<Vector3D>;
        private var _positions2:Vector.<Vector3D>;
        private var _posNum:Number = -1;
        private var _last:Vector3D;
        private var _right:Vector3D;
        private var _look:Vector3D;
        private var _boundPoints:Vector.<Number>;
        private var _startPosDirty:Boolean;

        public function SinglePointRibbon(target:ObjectContainer3D, segmentCount:int, height:Number, material:MaterialBase=null)
        {
            var i:int;
            _last = new Vector3D();
            _right = new Vector3D();
            _look = new Vector3D();
            var geometry:Geometry = new PlaneGeometry(0, height, segmentCount, 1, false);
            super(segmentCount, geometry, material);
            _target = target;
            _segmentCount = segmentCount;
            _positions1 = new Vector.<Vector3D>((segmentCount + 1));
            _positions2 = new Vector.<Vector3D>((segmentCount + 1));
            _halfHeight = (height / 2);
            i = 0;
            while (i < (segmentCount + 1))
            {
                _positions1[i] = new Vector3D();
                _positions2[i] = new Vector3D();
                i++;
            };
            _boundPoints = new Vector.<Number>(6, true);
        }

        override public function get assetType():String
        {
            return ("ribbon");
        }

        public function get target():ObjectContainer3D
        {
            return (_target);
        }

        public function set target(value:ObjectContainer3D):void
        {
            _target = value;
        }

        public function get autoUpdate():Boolean
        {
            return (_autoUpdate);
        }

        public function set autoUpdate(value:Boolean):void
        {
            if ((_autoUpdate == value))
            {
                return;
            }
            _autoUpdate = value;
            if (_autoUpdate)
            {
                start();
            }
            else
            {
                stop();
            }
        }

        override public function set ribbonHeight(value:Number):void
        {
            if ((value == this.ribbonHeight))
            {
                return;
            }
            if (_geometry)
            {
                _geometry.dispose();
            }
            geometry = validateRibbonProperty(_segmentCount, value);
        }

        public function get segmentCount():int
        {
            return (_segmentCount);
        }

        public function set segmentCount(value:int):void
        {
            if ((_segmentCount == value))
            {
                return;
            }
            if (_geometry)
            {
                _geometry.dispose();
            }
            _segmentCount = value;
            geometry = validateRibbonProperty(_segmentCount, this.ribbonHeight);
        }

        protected function validateRibbonProperty(seg:int, height:Number):Geometry
        {
            var i:int;
            var geometry:Geometry = new PlaneGeometry(0, height, seg, 1, false);
            if (!_positions1)
            {
                _positions1 = new Vector.<Vector3D>((seg + 1));
            }
            if (!_positions2)
            {
                _positions2 = new Vector.<Vector3D>((seg + 1));
            }
            var _local5 = (seg + 1);
            _positions2.length = _local5;
            _positions1.length = _local5;
            _halfHeight = (height / 2);
            _segmentCount = seg;
            i = 0;
            while (i < (seg + 1))
            {
                _local5 = i;
                _positions1[_local5] = ((_positions1[_local5]) || (new Vector3D()));
                _positions1[i].setTo(0, 0, 0);
                _local5 = i;
                _positions2[_local5] = ((_positions2[_local5]) || (new Vector3D()));
                _positions2[i].setTo(0, 0, 0);
                i++;
            }
            return geometry;
        }

        override public function start():void
        {
            reset();
            super.start();
        }

        protected function reset():void
        {
            var i:int;
            var pos:Vector3D = ((_target) ? (_target.scenePosition) : scenePosition);
            _last.copyFrom(pos);
            i = 0;
            while (i < (_segmentCount + 1))
            {
                _positions1[i].copyFrom(_last);
                _positions2[i].copyFrom(_last);
                i++;
            }
        }

        override public function set scene(value:Scene3D):void
        {
            super.scene = value;
            if (scene && scene.view)
            {
                _startPosDirty = true;
            }
        }

        override protected function updateBounds():void
        {
            super.updateBounds();
            var pos:Vector3D = _positions1[0];
            _boundPoints[0] = pos.x;
            _boundPoints[1] = pos.y;
            _boundPoints[2] = pos.z;
            pos = _positions2[_segmentCount];
            _boundPoints[3] = pos.x;
            _boundPoints[4] = pos.y;
            _boundPoints[5] = pos.z;
            _bounds.fromVertices(_boundPoints);
            _boundsInvalid = false;
        }

        override protected function ribbonInternalUpdate(deltaTime:int):void
        {
            var i:int;
            var index0:int;
            var index1:int;
            var pos1 = null;
            var pos2 = null;
            if (_startPosDirty)
            {
                _startPosDirty = false;
                reset();
            }
            var pos:Vector3D = ((_target) ? (_target.scenePosition) : scenePosition);
            _right.copyFrom(pos);
            _right.decrementBy(_last);
            _look.copyFrom(pos);
            if (scene)
            {
                _look.decrementBy(scene.view.camera.scenePosition);
            }
            var up:Vector3D = _look.crossProduct(_right);
            up.normalize();
            _last.copyFrom(pos);
            var currentVector:Vector3D = _positions1.pop();
            currentVector.copyFrom(pos);
            up.scaleBy(_halfHeight);
            currentVector.incrementBy(up);
            _positions1.unshift(currentVector);
            currentVector = _positions2.pop();
            currentVector.copyFrom(pos);
            up.scaleBy(-1);
            currentVector.incrementBy(up);
            _positions2.unshift(currentVector);
            var data:ByteArray = this.geometry.subGeometries[0].vertexData;
            var stride:uint = this.geometry.subGeometries[0].vertexStride;
            while (i < (_segmentCount + 1))
            {
                index0 = (i * stride);
                index1 = ((i * stride) + ((_segmentCount + 1) * stride));
                pos1 = _positions1[i];
                pos2 = _positions2[i];
                data.position = (index0 << 2);
                data.writeFloat(pos1.x);
                data.writeFloat(pos1.y);
                data.writeFloat(pos1.z);
                data.position = (index1 << 2);
                data.writeFloat(pos2.x);
                data.writeFloat(pos2.y);
                data.writeFloat(pos2.z);
                i++;
            }
            CompactSubGeometry(geometry.subGeometries[0]).updateData(data);
        }

        override public function clone():Object3D
        {
            var clone:SinglePointRibbon = new SinglePointRibbon(target, segmentCount, ribbonHeight, material);
            clone.autoUpdate = autoUpdate;
            clone.target = target;
            clone.transform = transform;
            clone.pivotPoint = pivotPoint;
            clone.partition = partition;
            if (_bounds)
            {
                clone.bounds = _bounds.clone();
            }
            clone.name = name;
            clone.castsShadows = castsShadows;
            clone.shareAnimationGeometry = shareAnimationGeometry;
            clone.mouseEnabled = this.mouseEnabled;
            clone.mouseChildren = this.mouseChildren;
            clone.overwriteBounds = this.overwriteBounds;
            clone.userMin = this.userMin.clone();
            clone.userMax = this.userMax.clone();
            clone.gpuBoundsMax = this.gpuBoundsMax.clone();
            clone.gpuBoundsMin = this.gpuBoundsMin.clone();
            clone.autoGpuBounds = this.autoGpuBounds;
            clone.layerType = this.layerType;
            clone.displayLevel = this.displayLevel;
            clone.zOffset = this.zOffset;
            clone.extra = this.extra;
            if (animator)
            {
                clone.animator = animator.clone();
            }
            return clone;
        }

        override public function dispose():void
        {
            var geometry:Geometry = this.geometry;
            super.dispose();
            if (geometry)
            {
                geometry.dispose();
            }
            if (_positions1)
            {
                _positions1.length = 0;
            }
            if (_positions2)
            {
                _positions2.length = 0;
            }
            _positions2 = null;
            _positions1 = null;
            _target = null;
        }
    }
}