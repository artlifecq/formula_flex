package com.rpgGame.core.view.uiComponent.face.cd
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.core.view.uiComponent.face.NumberBitmap;
	
	import flash.display.BitmapData;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import starling.display.Canvas;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.textures.BitmapFontTexture;

	/**
	 * CDFace
	 * @author Carver
	 */
	public class CDFace extends Sprite implements IPoolClass
	{
		/**
		 * CDFace池
		 */
		private static var _pool : Pool = new Pool("CDFace.cdFacePool", 100);

//		private var _now:Number = 0;//目前时间
//		private var _cd:Number = 0; //总CD时间
//		//缓动用
//		private var _obj:Object = {angle:0};
		//画图用
		//private var _mask : Shape;
//		private var _r : Number;
		private var _w : Number;
		private var _h : Number;
		//
		private var _circleMask : Shape;
		private var _isCircle : Boolean = false;
		/**
		 * 是否反转
		 * @L.L.M.Sunny
		 */
		private var _isReverse : Boolean = false;
		//完成回调
		private var _onComplete : Function;
		private var _imageMask : Canvas;

		private var _tmTxt : NumberBitmap; //guoqing.wen

		private static const circleMaskBmpData : BitmapData = new BitmapData(1, 1, true, 0x0);

		public function CDFace($width : Number, $height : Number, $onComplete : Function = null, $isCircle : Boolean = false, isReverse : Boolean = false)
		{
			reSet([$width, $height, $onComplete, $isCircle, isReverse]);
		}

		public static function create($width : Number, $height : Number, $onComplete : Function = null, $isCircle : Boolean = false, isReverse : Boolean = false) : CDFace
		{
			return _pool.createObj(CDFace, $width, $height, $onComplete, $isCircle, isReverse) as CDFace;
		}

		public static function recyle($cdFace : CDFace) : void
		{
			_pool.disposeObj($cdFace);
		}

		override public function dispose() : void
		{
//			_now = 0;
//			_cd = 0;
//			_obj = {angle:0};
			_onComplete = null;
			_w = 0;
			_h = 0;
			/*this.graphics.clear();*/ //guoqing.wen
			if (_tmTxt && _tmTxt.parent)
			{
				_tmTxt.parent.removeChild(_tmTxt);
			}
			if (_circleMask && _circleMask.parent)
			{
				_circleMask.parent.removeChild(_circleMask);
				_circleMask.dispose();
			}
			//DisplayUtil.removeForParent(_circleMask);
			_circleMask = null;
			if (_imageMask && _imageMask.parent)
			{
				_imageMask.parent.removeChild(_imageMask);
				_imageMask.dispose();
			}
			_imageMask = null;
			this.mask = null;
			_isCircle = false;
			_isReverse = false;
		}

		public function showTmTxt(txtFormat : TextFormat = null) : void
		{
			if (!_tmTxt)
			{
				txtFormat = txtFormat || new TextFormat(null, 14, 0x8b8d7b, true, null, null, null, null, TextFormatAlign.CENTER);
				txtFormat.letterSpacing=2;
				var texture : BitmapFontTexture = MaskCDUtil.getAssetTexture("CDFace_text") as BitmapFontTexture;
				if (texture == null)
				{
					texture = BitmapFontTexture.createBitmapNumberTexture("0.123456789", txtFormat, [new GlowFilter(0x000e07, 1, 2, 2, 15, BitmapFilterQuality.LOW)]);
					MaskCDUtil.addBitmapFontTexture("CDFace_text", texture);
				}
				_tmTxt = new NumberBitmap(texture);
				_tmTxt.numberGap = -2;
				_tmTxt.x = _w/2;
				_tmTxt.y =_h/2;
//				_tmTxt.filters = [new GlowFilter(0x000e07, 1, 2, 2, 15, BitmapFilterQuality.LOW)];//guoqing.wen
			}
			addChild(_tmTxt);
		}

		public function hideTmTxt() : void
		{
			if (_tmTxt != null && _tmTxt.parent != null)
				_tmTxt.parent.removeChild(_tmTxt);
//			_tmTxt.dispose();
//			_tmTxt.visible = false;
			//DisplayUtil.removeForParent(_tmTxt);//guoqing.wen
//			_tmTxt = null;
		}

		public function reSet($parameters : Array) : void
		{
			_w = $parameters[0] / 2;
			_h = $parameters[1] / 2;
			_onComplete = $parameters[2];
			_isCircle = $parameters[3];
			_isReverse = $parameters[4];

//			if (!_mask)
//			{
//				_mask = new Shape();
//			}
//			_mask.x = _w;
//			_mask.y = _h;
//			_mask = this;//guoqing.wen
//			this.addChildAt(_mask, 0);

			_imageMask = new Canvas();
			addChildAt(_imageMask, 0);
			_imageMask.x = _w;
			_imageMask.y = _h;
			_imageMask.scaleX = (_isReverse ? -_w : _w) / MaskCDUtil.MASK_RADIUS;
			_imageMask.scaleY = _h / MaskCDUtil.MASK_RADIUS;

			if (_isCircle)
			{
				if (!_circleMask)
				{
					_circleMask = new Shape();
				}
				_circleMask.graphics.clear();
//				_circleMask.graphics.beginBitmapFill(circleMaskBmpData);
				_circleMask.graphics.drawCircle(0, 0, _w);
				_circleMask.graphics.endFill();
				this.addChild(_circleMask);
				this.mask = _circleMask;
			}
			else
			{
				if (_circleMask && _circleMask.parent)
				{
					_circleMask.parent.removeChild(_circleMask);
					_circleMask.dispose();
				}
				//DisplayUtil.removeForParent(_circleMask);
				_circleMask = null;
			}

			//DrawHelper.drawRect(this,new Point(0,0),new Point($parameters[0],$parameters[1]),new StyleData(0,0,0,0,0.5),true);
//			var g:Graphics = this.graphics;
//			g.clear();
//			g.lineStyle(0,0,1);
//			g.beginFill(0,0.5);
//			g.drawRect(0,0,$parameters[0],$parameters[1]);
//			g.endFill();
//			this.mask = _mask;
		}

		/**
		 * 开始
		 * @param $cd CD时长（毫秒）
		 * @param $start 开始时间（毫秒）
		 * */
//		public function play($cd:int, $start:int=0):void
//		{
//			if($cd <= 0 || $start < 0)
//			{
//				throw new Error("CD时间小于0的嘛..,傻XX :　"+"$cd : "+$cd+"$start : "+$start);
//				return;
//			}
//			
//			stop(false);
//			
//			_now = $start;
//			_cd = $cd;
//			
//			_obj.angle = _cd!=0 ? _now/_cd*360 : 360;
//			if(lostTm>0)
//			{
//				onUpdate();
//				TweenLite.to(_obj, lostTm*0.001, {angle:360, onUpdate:onUpdate, onComplete:onComplete,ease:Linear.easeNone});
//			}
//			else
//			{
//				onComplete();
//			}
//		}
//		
//		private function onUpdate():void
//		{
//			update(_obj.angle);
//		}
//		
//		private function onComplete():void
//		{
//			update(360);
//			if(_onComplete!=null)
//			{
//				_onComplete(this);
//			}
//			//
//			_pool.disposeObj(this);
//		}

		/**
		 * 停止
		 * @param $complete 是否执行完成动作
		 * */
//		public function stop($complete:Boolean=true):void
//		{
//			TweenLite.killTweensOf(_obj,$complete);
//		}

//		/**
//		 * 取得剩余时间（秒）
//		 * */
//		public function get lostTm():Number	
//		{
//			return _cd - _now;
//		}
//		
//		public function get now():Number	
//		{
//			return _now ;
//		}
//		
//		public function set now($value:Number):void	
//		{
//			_now = $value;
//		}
//		
//		public function get cd():Number	
//		{
//			return _cd ;
//		}
//		
//		public function set cd($value:Number):void	
//		{
//			_cd = $value;
//		}

		/**
		 * 更新
		 * @param $angle 角度
		 */
		public function update($now : Number, $cdTotal : Number) : void
		{
			var $angle : Number = $now / $cdTotal * 360;
			if (_tmTxt)
			{
				_tmTxt.numberText = (($cdTotal - $now) * 0.001).toFixed(1);
			}
			drawRectMask($angle);
		}

		private function drawRectMask($angle : Number) : void
		{
			$angle = Math.floor($angle)

			if ($angle <= 0)
				return;
			MaskCDUtil.drawPolygonMask(_imageMask, _isReverse ? (360 - $angle) : $angle);
		}
	}
}
