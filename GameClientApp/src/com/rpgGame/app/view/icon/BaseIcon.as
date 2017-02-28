package com.rpgGame.app.view.icon
{
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	
	import feathers.controls.UIAsset;
	
	/**
	 * 所有icon基类，
	 * 只有一个ico的图片,其他任何东西都没有,
	 * 没有品质框,没有数量显示,没有tips, 没有背景,就是光秃秃一张ico图片。
	 * 只有一个设置图片的方法   setIconResName(iconResName);
	 * 
	 */
	public class BaseIcon extends UIAsset 
	{
		private var _iconResURL:String = "";
		/** ico的bitmaodata  */		
		protected var _iconImage:UIAsset;
		
		protected var _iconSize:int = IcoSizeEnum.SIZE_46;
		
		/**
		 * 图标/选择框在icon中的位置 
		 */		
		protected var _iconPositionX : int = 0;
		
		protected var _iconPositionY : int = 0;
		/**绑定图片**/
		protected var _bindImage : UIAsset;
		/**穿戴图片**/
		protected var _wearImage : UIAsset;
		
		/**
		 * 格子大小 
		 * @param $iconSize
		 * 
		 */		
		public function BaseIcon($iconSize:int)
		{
			_iconSize = $iconSize;
			_iconSize = _iconSize <= 0 ? IcoSizeEnum.SIZE_46 : _iconSize;
			this.width = _iconSize;
			this.height = _iconSize;
		}
		
		/**
		 * 设置图标 
		 * @param iconResURL url地址
		 * 
		 */		
		public function setIconResName( iconResURL:String ):void
		{
			if( _iconResURL == iconResURL )
				return;
			_iconResURL = iconResURL;
			
			if( _iconImage == null )
			{
				_iconImage = new UIAsset();
				_iconImage.width = _iconSize;
				_iconImage.height = _iconSize;
				addChild( _iconImage );
			}
			updateIconImagePosition();
			_iconImage.styleName = iconResURL;
		}
		
		/**
		 * 设置物品图标x/y的偏移值 
		 * @param posx
		 * @param posy
		 * @author 陈鹉光 2016-06-15 改
		 */		
		protected function updateIconImagePosition( posx:Number=0, posy:Number=0 ):void
		{
			if(!_iconImage)
				return;
			switch(_iconSize)
			{
				case  IcoSizeEnum.ICON_42:
						_iconImage.x = 1;
						_iconImage.y = 1;
					break;
				case  IcoSizeEnum.SIZE_40:
					if( posx != 0 || posy != 0 )
					{
						_iconImage.x = posx;
						_iconImage.y = posy;
					}
					else
					{
						_iconImage.x = 0;
						_iconImage.y = 0;
					}
					break;
				case  IcoSizeEnum.SIZE_46:
					if( posx != 0 || posy != 0 )
					{
						_iconImage.x = posx;
						_iconImage.y = posy;
					}
					else
					{
						_iconImage.x = 4;
						_iconImage.y = 4;
					}
					break;
				case  IcoSizeEnum.SIZE_60:
					if( posx != 0 || posy != 0 )
					{
						_iconImage.x = posx;
						_iconImage.y = posy;
					}
					else
					{
						_iconImage.x = 8;
						_iconImage.y = 8;
					}
					break;
			}
		}
		
		public function setIsBind(v:Boolean):void
		{
			if(v)
			{
				if(!_bindImage)
				{
					_bindImage = new UIAsset();
					addChild(_bindImage);
				}
				switch(_iconSize)
				{
					case IcoSizeEnum.SIZE_60:
						_bindImage.styleName=AssetUrl.EQUIP_BIND_60;
						_bindImage.x = 50;
						_bindImage.y = 50;
						break;
					case IcoSizeEnum.SIZE_46:
						_bindImage.styleName=AssetUrl.EQUIP_BIND_46;
						_bindImage.x = 32;
						_bindImage.y = 32;
						break;
				}
				this.setChildIndex(_bindImage,numChildren);
			}else
			{
				if(_bindImage && _bindImage.parent)
					_bindImage.parent.removeChild(_bindImage);
				_bindImage = null;
			}
		}
		
		public function setIsWear(v:Boolean):void
		{
			if(v)
			{
				if(!_wearImage)
				{
					_wearImage = new UIAsset();
					addChild(_wearImage);
				}
				switch(_iconSize)
				{
					case IcoSizeEnum.SIZE_60:
						_wearImage.styleName=AssetUrl.EQUIP_WARING_60;
						_wearImage.x = 8;
						_wearImage.y = 8;
						break;
					case IcoSizeEnum.SIZE_46:
						_wearImage.styleName=AssetUrl.EQUIP_WARING_46;
						_wearImage.x = 4;
						_wearImage.y = 4;
						break;
				}
				this.setChildIndex(_wearImage,numChildren);
			}else
			{
				if(_wearImage && _wearImage.parent)
					_wearImage.parent.removeChild(_wearImage);
				_wearImage = null;
			}
		}
		
		/**
		 * 清空 只是把显示数据清除 并不全部销毁
		 * */
		public function clear():void
		{
			_iconResURL = "";
			
			if( _iconImage != null && _iconImage.parent != null )
			{
				_iconImage.parent.removeChild( _iconImage ); 
				_iconImage = null;
			}
			if(_bindImage && _bindImage.parent)
				_bindImage.parent.removeChild(_bindImage);
			_bindImage = null;
			if(_wearImage && _wearImage.parent)
				_wearImage.parent.removeChild(_wearImage);
			_wearImage = null;
		}
		
		/**
		 * 详细见 EnumIcoSize.as
		 */
		public function get iconSize():int
		{
			return _iconSize;
		}

		/** ico资源的路径 */
		public function get iconResURL():String
		{
			return _iconResURL;
		}

		
	}
}