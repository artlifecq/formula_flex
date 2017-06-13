package com.rpgGame.app.view.icon
{
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	
	import away3d.events.Event;
	
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
		 *是符合符合职业 
		 */
		protected var _jobImage:UIAsset;
		
		protected var _lvImage:UIAsset;
		
		/**
		 * 格子大小 
		 * @param $iconSize
		 * 
		 */		
		public function BaseIcon($iconSize:int)
		{
			_iconSize = $iconSize;
			_iconSize = _iconSize <= 0 ? IcoSizeEnum.SIZE_46 : _iconSize;
			switch(_iconSize){
				case IcoSizeEnum.ICON_64:
					_iconPositionX=_iconPositionY=7;
					break;
				case IcoSizeEnum.ICON_48:
					_iconPositionX=_iconPositionY=6;
					break;
			}
			this.width = _iconSize;
			this.height = _iconSize;
		}
		
		/**
		 * 设置图标 
		 * @param iconResURL url地址
		 * 
		 */		
		public function setIconResName( iconResURL:String , isSetSelect:Boolean=true):void
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
			updateIconImagePosition(_iconPositionX,_iconPositionY);
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
				case  IcoSizeEnum.ICON_48:
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
				case  IcoSizeEnum.ICON_64:
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
			}
		}
		
		public function setLV(lv:int):void
		{
			if(lv<=0||lv>10){
				return;
			}
			
			if(!_lvImage)
			{
				_lvImage = new UIAsset();
				addChild(_lvImage);
			}
			_lvImage.styleName=AssetUrl.EQUIP_LV+lv+".png";
			_lvImage.x = 0;
			_lvImage.y = 0;
			if(_iconSize==IcoSizeEnum.ICON_48){
				_lvImage.x = 4;
				_lvImage.y = 4;
			}else if(_iconSize==IcoSizeEnum.ICON_64){
				_lvImage.x = 8;
				_lvImage.y = 8;
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
					case IcoSizeEnum.ICON_42:
						_bindImage.styleName=AssetUrl.EQUIP_BIND_42;
						_bindImage.x = 6;
						_bindImage.y = 27;
						break;
					case IcoSizeEnum.ICON_64:
						_bindImage.styleName=AssetUrl.EQUIP_BIND_64;
						_bindImage.x = 14;
						_bindImage.y = 47;
						break;
					case IcoSizeEnum.ICON_48:
						_bindImage.styleName=AssetUrl.EQUIP_BIND_42;
						_bindImage.x = 12;
						_bindImage.y = 33;
						break;
				}
//				this.setChildIndex(_bindImage,numChildren);
			}else
			{
				if(_bindImage && _bindImage.parent)
					_bindImage.parent.removeChild(_bindImage);
				_bindImage = null;
			}
		}
		
		public function setJobState(state:String):void
		{
			if(!state){
				if(_jobImage && _jobImage.parent)
					_jobImage.parent.removeChild(_jobImage);
				_jobImage = null;
				return;
			}
			
			if(!_jobImage)
			{
				_jobImage = new UIAsset();
				addChild(_jobImage);
			}
			
			_jobImage.styleName=state;
			_jobImage.x = _iconSize-13;
			_jobImage.y = _iconSize-13;
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
					case IcoSizeEnum.ICON_64:
						_wearImage.styleName=AssetUrl.EQUIP_WARING_64;
						_wearImage.x = 64-35+_iconPositionX;
						_wearImage.y=0+_iconPositionY;
						break;
					case IcoSizeEnum.ICON_42:
						_wearImage.styleName=AssetUrl.EQUIP_WARING_42;
						_wearImage.x = 42-24+_iconPositionX;
						_wearImage.y=0+_iconPositionY;
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
			
			if(_jobImage && _jobImage.parent)
				_jobImage.parent.removeChild(_jobImage);
			_jobImage = null;
			
			if(_lvImage && _lvImage.parent)
				_lvImage.parent.removeChild(_lvImage);
			_lvImage = null;
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