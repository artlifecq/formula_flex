package com.rpgGame.app.fight.spell
{
	import feathers.controls.UINumber;
	import feathers.core.FeathersControl;
	import feathers.themes.GuiTheme;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.IStarlingTexture;
	
	public class NumberTextImage extends FeathersControl implements IAnimatable
	{
		protected var _rollerIn:Boolean = false;
		protected var _rollerTextArr:Vector.<ImageList>;
		protected var _text:String;
		protected var _rollerText:String;
		protected var _rollerQuality:int = 1;
		public var isRollerEnd:Boolean = false;
		protected var _maskSprite:Sprite = null;
		protected var _isTopDiction:Boolean = true;
		
		private var _imageCount:UINumber;
		private var _isShowSymbol:Boolean;
		private var _isout:Boolean;
		private var _completeHandler:Function;
		public function NumberTextImage(num:UINumber,completeFun:Function,isshowSymbol:Boolean=false,isout:Boolean=false):void
		{
			_imageCount = num;
			_isShowSymbol = isshowSymbol;
			_isout = isout;
			_completeHandler = completeFun;
			super();
			initView();
		}
		protected function initView():void
		{
			isRollerEnd = false;
			this.x = _imageCount.x;
			this.y = _imageCount.y;
			_imageCount.parent.removeChild(_imageCount);
		}
		private var _starNum:int;
		private var _endNum:int;
		public function init(statNum:int,endnum:int,isTopDiction:Boolean):void
		{
			_starNum = Math.abs(statNum);
			_endNum =  Math.abs(endnum);
			_isTopDiction = isTopDiction;
			this._imageCount.touchable = false;
			getAvailableText();
			refeahView();
		}
		
		private function refeahView():void
		{
			_rollerTextArr = new Vector.<ImageList>();
			var length:int = _text.length;
			var char:String;
			var prevCharWidth:int = 0;
			var prevCharX:int = 0;
			var h:Number = 0;
			var charcode:int;
			var listImg:ImageList;
			var img:Image;
			var quality:int;
			var helpY:Number;
			for(var i:int =0;i<length;i++)
			{
				listImg = new ImageList(_isTopDiction,_isout);
				char = _text.charAt(i);
				charcode = _text.charCodeAt(i);
				img = creatNumberClip(char);
				//横向布局
				img.y = 0;
				var charWidth:int =img.width;
				img.x = prevCharX + prevCharWidth + (i > 0 ? _imageCount.gap : 0);
				prevCharWidth = charWidth;
				prevCharX = img.x;
				this.addChild(img);
				h = Math.max(h,img.height);
				listImg.pushImage(img);
				if(charcode>=48&&charcode<=57)
				{
					quality = 0;
					while(quality<_rollerQuality)
					{
						img = creatNumberClip(getRollerText(i));
						listImg.pushImage(img);
						this.addChild(img);
						quality++;
					}
					img = creatNumberClip(_rollerText.charAt(i));
					listImg.pushImage(img);
					this.addChild(img);
				}
				listImg.layoutImg();
				_rollerTextArr.push(listImg);
			}
			this.setSize(prevCharWidth+prevCharX,h);
			_maskSprite = new Sprite();
			_maskSprite.graphics.beginFill();
			_maskSprite.graphics.drawRect(0,0,this.width,this.height);
			_maskSprite.graphics.endFill();
			this.addChild(_maskSprite);
			this.mask = _maskSprite;
		}
		
		private function getRollerText(index:int):String
		{
			var random:int = Math.random()*10+48;
			var count:int = 100;
			while(count>0)
			{
				count--;
				random=Math.random()*10+48;
				if(random>=58)
				{
					random=57;
				}
				if(random!=_text.charCodeAt(index) && random != _rollerText.charCodeAt(index))
				{
					return String.fromCharCode(random);
				}
			}
			return String.fromCharCode(random);
		}
		private function creatNumberClip(char:String):Image
		{
			var img:Image;
			var frameLabel:String = getFrameLabel(char);
			var clipStyleName:String = _imageCount.skin.skinNames[frameLabel];
			
			if(!clipStyleName)
			{
				trace("[UINumber styleName="+_imageCount.styleName+ "] char: "+char+" texture is missing");
				return null;
			}
			var texture:IStarlingTexture = GuiTheme.ins.getTexture(clipStyleName);
			if(!img)
			{
				img = new Image(texture);
			}
			img.texture = texture;
			img.pixelSnapping = true;
			return img;
		}
		
		private function getFrameLabel(char:String):String
		{
			if(_imageCount.frameLabelPreFix && char && char.indexOf(_imageCount.frameLabelPreFix) == 0)
			{
				return char;
			}
			
			var frameLabel:String = (_imageCount.frameLabelPreFix ? _imageCount.frameLabelPreFix : "") + char;
			
			if(!hasOwnFrameLabel(frameLabel))
			{
				char = char.charCodeAt().toString();
				frameLabel = (_imageCount.frameLabelPreFix ? _imageCount.frameLabelPreFix : "") + char;
			}
			
			return frameLabel;
		}
		private function hasOwnFrameLabel(frameLabel:String):Boolean
		{
			return _imageCount.skin && _imageCount.skin.skinNames.hasOwnProperty(frameLabel);
		}
		private function getAvailableText():void
		{
			_text = _starNum.toString();
			_rollerText = _endNum.toString();
			var length1:int = _text.length;
			var length2:int = _rollerText.length;
			if( length1 == length2)
				return ;
			var length:int = Math.max(length1,length2);
			var str:String = _text;
			if(length2<length)
				str = _rollerText;
			while(str.length<length)
			{
				str ="0"+str;
			}
			if(length2<length)
			{
				_rollerText = str;
			}else{
				_text = str;
			}
			
			if(!_isShowSymbol)
				return ;
			if(_isTopDiction)
			{
				_text ="x"+_text;
				_rollerText ="x"+_rollerText;
			}else{
				_text ="-"+_text;
				_rollerText ="-"+_rollerText;
			}
		}
		
		
		public function startRolling():void
		{
			if(_rollerIn)
				return ;
			_rollerIn = true;
			
		}
		
		private var _rollItem:ImageList;
		public function advanceTime(time:Number):void
		{
			if(_rollItem==null&&_rollerTextArr.length==0)
			{
				stopRun();
				
				return ;
			}
			if(_rollItem!=null&&_rollItem.isRunOver())
			{
				_rollItem.removeOther();
				_rollItem = null;
			}
			if(_rollItem==null)
				_rollItem = _rollerTextArr.pop();
			if(_rollItem!=null)
				_rollItem.run();
		}
		
		public function stopRun(iscall:Boolean=true):void
		{
			if(Starling.juggler.contains(this))
				Starling.juggler.remove(this);
			isRollerEnd = true;
			if(_completeHandler!=null)
				_completeHandler();
			this.mask = null;
		}
	}
}
import starling.display.Image;


class ImageList
{
	private var _imageList:Vector.<Image>;
	private var _isTopDiction:Boolean;
	private static var rollerSpeed:Number = 20;
	private var _isOut:Boolean;
	private var _targetPosition:Number;
	public function ImageList(isTopDiction:Boolean,isout:Boolean):void
	{
		_imageList = new Vector.<Image>();
		_isTopDiction = isTopDiction;
		_isOut = isout;
		_targetPosition = 0;
	}
	public function pushImage(img:Image):void
	{
		_imageList.push(img);
	}
	
	public function layoutImg():void
	{
		var length:int = _imageList.length;
		var helpX:Number = _imageList[0].x;
		var helpY:Number;
		var i:int;
		var helph:Number = 0;
		if(_isTopDiction)
		{
			helph = helpY = _imageList[0].height;
			for(i = 1;i<length;i++)
			{
				_imageList[i].x = helpX;
				_imageList[i].y = helpY;
				helpY += _imageList[i].height;
				helph = Math.max(helph,_imageList[i].height);
			}
			_targetPosition = -helph;
		}else{
			helpY = 0;
			helph = _imageList[0].height;
			for(i = 1;i<length;i++)
			{
				_imageList[i].x = helpX;
				helpY -= _imageList[i].height;
				_imageList[i].y = helpY;
				helph = Math.max(helph,_imageList[i].height);
			}
			_targetPosition = helph;
		}
		if(!_isOut)
		{
			_targetPosition = 0
		}
	}
	
	public function isRunOver():Boolean
	{
		var length:int = _imageList.length;
		return _imageList[length-1].y==_targetPosition;
	}
	
	public function run():void
	{
		var length:int =_imageList.length;
		var distance:Number = Math.abs(_imageList[length-1].y-_targetPosition);
		var speed:Number = rollerSpeed;
		if(distance<speed)
		{
			speed = distance;
		}
		for(var i:int = 0;i<length;i++)
		{
			if(_isTopDiction)
				_imageList[i].y -= speed;
			else
				_imageList[i].y +=speed;
		}
	}
	
	public function removeOther():void
	{
		var length:int =_imageList.length;
		if(!_isOut)
		{
			length --;
		}
		for(var i:int=0;i<length;i++)
		{
			_imageList[i].parent.removeChild(_imageList[i],true);
		}
	}
}