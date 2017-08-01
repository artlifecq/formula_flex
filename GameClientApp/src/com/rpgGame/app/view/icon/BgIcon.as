package com.rpgGame.app.view.icon
{
	import com.rpgGame.app.manager.EftMcManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	
	import flash.geom.Point;
	
	import app.message.Quality;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.text.Fontter;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextFieldAutoSize;
	import starling.utils.Align;
	
	
	/**
	 * 所有icon和tip显示的基类
	 * (
	 * 仅包含物品icon		[通过 setIconResName() 方法设置]		父类的方法
	 * 物品品质			[通过 showQuality() 方法设置]
	 * 物品数量			[通过 count() 方法设置]
	 * 背景				[通过 setBg() 方法设置]
	 * 注意以上设置都需要你手动调用
	 * 若面板只是展示物品建议用它
	 * 默认没有背景,要添加背景请使用 setBg()方法
	 * )
	 * @author luguozheng
	 * 
	 */	
	public class BgIcon extends BaseIcon
	{
		
		private var _alwayShowCount:Boolean
		
		/** 显示数量用的文本框 */		
		protected var _countText:Label;
		/** ico的品质  */
		protected var _qualityId:int = -1;
		/**
		 * 品质框特效 
		 */		
		protected var _qualityImage : UIAsset;
		/**选中框资源路径**/
		private var _selectRes:String;
		/** 选中框 */		
		protected var _selectImage:UIAsset;
		/** 背景资源路径 **/
		protected var _bgResName:String;
		/** ico的背景bitmapdata  */		
		protected var _bgImage:UIAsset;
		/** 锁定图片，大小对应格子的大小**/
		private var _lockAsset : UIAsset;
		/**是否显示锁定图片**/
		protected var isShowLockAsset : Boolean = false;
		/**是否需要显示选中框**/
		protected var isShow : Boolean = true;
		
		protected var _qualityEft:UIMovieClip;
		
		public function BgIcon( $iconSize:int = IcoSizeEnum.SIZE_40 )
		{
			super( $iconSize );
			//			setSelectedImgSize($iconSize);
		}
		
		/**
		 *总是显示数量文本框 
		 */
		public function set alwayShowCount(value:Boolean):void
		{
			_alwayShowCount = value;
		}
		
		public function setUIRoot():void
		{
			
		}
		
		/**
		 * 显示品质 
		 * @param qualityID  详情请见 EnumItemQualityType
		 */		
		public function showQuality( qualityID:int ):void
		{
			_qualityId = qualityID;
			/*	if( _qualityId <= 0 )
			{
			hideQuality();
			return;
			}*/
			if(_qualityImage == null)
			{
				_qualityImage = new UIAsset();
			}
			setSelectedImgSize(iconSize);
			_qualityImage.onImageLoaded=onIcoComplete;
			_qualityImage.styleName = ClientConfig.getQualityBg( _qualityId ,iconSize);
			_qualityImage.visible=true;	
			_qualityImage.width=_qualityImage.height=_iconSize;
			if(qualityID>Quality.YELLOW){
				showQualityEft();
			}else{
				if(_qualityEft){
					_qualityEft.removeChildren();
				}
			}
			sortLayer();
		}
		
		private function showQualityEft():void
		{
			if(_qualityEft==null){
				_qualityEft=new UIMovieClip();
			}else{
				_qualityEft.removeChildren();
			}
			_qualityEft.touchable=false;
			if(_qualityId==Quality.GREEN){
				EftMcManager.setMcStyle(_qualityEft,"UIMovieClipQ_quality_zi");
			}else{
				EftMcManager.setMcStyle(_qualityEft,"UIMovieClipQ_quality_huang");
			}
			_qualityEft.frameRate=20;
			_qualityEft.autoPlay=true;
			//			var scaleV:Number=(90/64);
			_qualityEft.width=this.width;
			_qualityEft.height=this.width;
			//			var xy:Number=-1*(_iconSize/64)*(90-64)/2
			//			_qualityEft.x=xy;
			//			_qualityEft.y=xy;
		}		
		
		/** 隐藏品质框 */		
		public function hideQuality():void
		{
			if( _qualityImage != null )
				_qualityImage.visible = false;
			if(_qualityEft){
				_qualityEft.removeFromParent();
			}
		}
		
		
		/**销毁显示对象 */
		override public function destroy() : void
		{
			if(_bgImage){
				_bgImage.removeFromParent();
				_bgImage=null;
				_bgResName=null;
			}
			super.destroy();
		}
		
		/**
		 * 设置ico的背景图片, 参数详细请参考 GridBGType.as
		 */		
		public function setBg( value:String, alpha:Number=1 ):void
		{
			if(!value|| _bgResName == value )
				return;
			
			_bgResName = value;
			
			if( _bgImage == null )
			{
				_bgImage = new UIAsset();
				addChild( _bgImage );
				_bgImage.imageScaleMode=UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			}
			
			_bgImage.alpha = alpha;
			_bgImage.onImageLoaded = onBgImgComplete;
			_bgImage.styleName = ClientConfig.getGridBg( _bgResName );
			//因为从对象池取的，所以要设置下
//			_bgImage.width=S2W[_iconSize];
//			_bgImage.height=S2W[_iconSize];
			_bgImage.visible=true;
			sortLayer();
		}
		
		
		/**
		 *绑定一个背景资源 
		 * @param bg
		 * 
		 */
		public function bindBg(bg:UIAsset):void
		{
			if(_bgImage){
				_bgImage.removeFromParent();
			}
			_bgImage=bg;
			if(_bgImage){
				this.x=_bgImage.x;
				this.y=_bgImage.y;
				_bgImage.x=_bgImage.y=0;
				this.width=_bgImage.width;
				this.height=_bgImage.height;
			}else{
				this.width=_iconSize;
				this.height=_iconSize;
			}
			if(_qualityEft){
				_qualityEft.width=this.width;
				_qualityEft.height=this.width;
			}
	
			sortLayer();
			calIconPos();
		}
		
		override public function setIconResName( iconResURL:String , isSetSelect:Boolean=true):void
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
//			updateIconImagePosition(_iconPositionX,_iconPositionY);
			_iconImage.onImageLoaded = onIcoComplete;
			_iconImage.styleName = iconResURL;
			
			if(isSetSelect)
				setSelectedImgSize(iconSize);
		}
		
		//没找到对应的各种背景自己写了一个
		/**
		 * 设置ico的背景图片,传入url
		 */		
		public function setUrlBg( value:String, alpha:Number=1 ):void
		{
			if(!value|| _bgResName == value )
				return;
			
			_bgResName = value;
			
			if( _bgImage == null )
			{
				_bgImage = new UIAsset();
				addChild( _bgImage );
				_bgImage.imageScaleMode=UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			}
			
			_bgImage.alpha = alpha;
			_bgImage.onImageLoaded = onBgImgComplete;
			_bgImage.styleName =value;
			//因为从对象池取的，所以要设置下
//			_bgImage.width=S2W[_iconSize];
//			_bgImage.height=S2W[_iconSize];
			_bgImage.visible=true;
			sortLayer();
		}
		protected function setIsShowLockAsset(value:Boolean,isBind:Boolean):void
		{
			//			if(isShowLockAsset == value)
			//				return;
			isShowLockAsset = value;
			var styleName:String ;
			if(isBind)
				styleName = AssetUrl.ITEM_LOCK_ASSET;
			else
				styleName = AssetUrl.ITEM_USING_ASSET;
			onShowLockAsset(styleName);
		}
		
		protected function onShowLockAsset(styleName:String):void
		{
			if(!isShowLockAsset)
			{
				clearLockAsset();
				return;
			}
			if(!_lockAsset)
			{
				_lockAsset = new UIAsset();
				addChild(_lockAsset);
			}
			_lockAsset.styleName = styleName;
			_lockAsset.width = _iconSize;
			_lockAsset.height = _iconSize;
			updateLockAssetPosition();
		}
		
		protected function clearLockAsset():void
		{
			if(_lockAsset && _lockAsset.parent)
				_lockAsset.parent.removeChild(_lockAsset);
			_lockAsset = null;
		}
		
		protected function updateLockAssetPosition():void
		{
			if(!_lockAsset)
				return;
			switch(_iconSize)
			{
				//				case  IcoSizeEnum.SIZE_36:
				//					_lockAsset.x = 0;
				//					_lockAsset.y = 0;
				//					break;
				case  IcoSizeEnum.SIZE_40:
					_lockAsset.x = 0;
					_lockAsset.y = 0;
					break;
				case  IcoSizeEnum.SIZE_46:
					_lockAsset.x = 4;
					_lockAsset.y = 4;
					break;
				case  IcoSizeEnum.SIZE_60:
					_lockAsset.x = 8;
					_lockAsset.y = 8;
					break;
			}
		}
		
		/**
		 *icon更新完成 
		 * @param uiasset
		 * 
		 */
		private function onIcoComplete(uiasset:UIAsset):void
		{
			calIconPos();
		}
		
		
		override protected function calIconPos():void
		{
			_iconPositionX=0;
			_iconPositionY=0;
			if(_bgImage&&_bgImage.width!=0&&_iconImage&&_iconImage.width!=0){
				_iconPositionX=(_bgImage.width-_iconImage.width)/2;
			}
			if(_bgImage&&_bgImage.height!=0&&_iconImage&&_iconImage.height!=0){
				_iconPositionY=(_bgImage.height-_iconImage.height)/2;
			}
			if(_iconImage){
				_iconImage.x = _iconPositionX;
				_iconImage.y = _iconPositionY;
			}
			if(_qualityImage){
				_qualityImage.x = _iconPositionX;
				_qualityImage.y = _iconPositionY;
			}
		}
		
		/**
		 * 背景加载完成
		 * @param uiasset
		 * 
		 */
		protected function onBgImgComplete(uiasset:UIAsset):void
		{
			_bgImage.onImageLoaded=null;
			this.width=_bgImage.width;
			this.height=_bgImage.height;
			if(_qualityEft){
				_qualityEft.width=this.width;
				_qualityEft.height=this.width;
			}
			calIconPos();
		}
		
		/**
		 * 设置选中框的偏移值 
		 * @param x
		 * @param y
		 * 
		 */		
		public function setIconPoint(x:int,y:int):void
		{
			if(_iconPositionX == x && _iconPositionY == y)
				return;
			_iconPositionX = x;
			_iconPositionY = y;
			
			if(_selectRes)
			{
				_selectImage.x = _iconPositionX;
				_selectImage.y = _iconPositionY;
			}
			updateIconImagePosition( x, y );
		}
		
		/**
		 * 设置物品框的偏移值 
		 * @param x
		 * @param y
		 * 
		 */		
		public function setItemIconPoint(x:int,y:int):void
		{
			if( _bgImage != null )
			{
				_bgImage.x = x;
				_bgImage.y = y;
				updateIconImagePosition( x, y );
			}
		}
		
		/**
		 * 设置ico的背景图片, 参数详细请参考 GridBGType.as
		 */		
		private function setSelectImg( value:String ):void
		{
			if( "" == value)
			{
				clearSelectImage();
				return;
			}
			
			_selectRes = value;
			
			if( _selectImage == null )
			{
				_selectImage = new UIAsset();
				addChild( _selectImage );
				_selectImage.visible = false;
				addEventListener( TouchEvent.TOUCH, onTouchSelect );
			}
			
			if(_qualityId!=-1){
				_selectImage.styleName = ClientConfig.getSelectBg( _selectRes )+"_"+this._qualityId+ClientConfig.eName_PNG;
			}else{
				_selectImage.styleName = ClientConfig.getSelectBg( _selectRes )+"_"+0+ClientConfig.eName_PNG;
			}
			_selectImage.width=_selectImage.height=_iconSize;
			sortLayer();
		}
		
		/**
		 * 设置选择框显示隐藏 
		 * @param value
		 * 
		 */		
		public function set selectImgVisible( value:Boolean ):void
		{
			isShow = value;
		}
		
		private function setSelectedImgSize(size:int):void
		{
			setSelectImg(String(size));
		}
		
		/**
		 * 设置显示数量 
		 * @param value
		 * 
		 */		
		public function set count( value:int ):void
		{
			if( value <= 1 &&!_alwayShowCount)
			{
				setSubString("");
				return;
			}
			
			if( value > 10000 )
			{
				setSubString(int( value / 10000 ) + "万");
			}
			else
			{
				setSubString( value + "");
			}
		}
		/**
		 * 设置文字下标 
		 * 
		 */		
		public function setSubString(value:String):void
		{
			if( _countText == null )
				initCountText();
			_countText.htmlText = value;
			_countText.width=_countText.textWidth;
			_countText.x = _iconPositionX+iconSize - _countText.textWidth-2;
			_countText.y =_iconPositionY+ iconSize - _countText.maxHeight;			
//			_countText.x = iconSize - _countText.maxWidth;
//			_countText.y = iconSize - _countText.maxHeight;
			sortLayer();
		}
		
		/**
		 * 初始化数量文本
		 * 
		 */		
		protected function initCountText():void
		{
			_countText = new Label();
			_countText.width = 40;
			_countText.height = 20;
			_countText.touchable =false;
			_countText.autoSize = TextFieldAutoSize.HORIZONTAL;
			_countText.verticalAlign="middle";
			_countText.verticalCenter=-2;
			_countText.textAlign = Align.RIGHT;
			_countText.color = StaticValue.A_UI_BEIGE_TEXT;
			_countText.fontSize = 10;
			_countText.nativeFilters=Fontter.filterObj["labelFilterBlack"];
			addChild(_countText);
		}
		
		public function get countText():Label
		{
			return _countText;
		}
		
		/**
		 * 给格子里的东西排序 （在所有东西都，实例化后调用）
		 * 
		 */		
		public function sortLayer():void
		{
			if( _bgImage != null )
				addChild( _bgImage );
			
			if( _qualityImage != null )
			{
				addChild( _qualityImage );
			}
			if( _iconImage != null )
				addChild( _iconImage );
			
			
			if( _countText != null )
				addChild( _countText );
			
			if(_bindImage){
				addChild( _bindImage );
			}
			if(_jobImage){
				addChild( _jobImage );
			}
			if(_lvImage){
				addChild( _lvImage );
			}
			if( _selectImage != null )
				addChild( _selectImage );
			
			if(_wearImage){
				addChild( _wearImage );
			}
			if(_qualityEft){
				addChild( _qualityEft );
			}
		}
		
		/**
		 * 清除
		 * 
		 */		
		override public function clear():void
		{
			if( _countText )
				_countText.removeFromParent();
			
			if( _selectImage != null )
			{
				_selectImage.removeFromParent();
				_selectImage.visible=false;
			}
			//不用清理背景
//			if(_bgImage){
//				_bgImage.removeFromParent();
//				_bgImage=null;
//			}
			clearLockAsset();
			hideQuality();
	
			
			if(_qualityEft){
				_qualityEft.removeFromParent();
				_qualityEft.stop();
				_qualityEft.dispose();
				_qualityEft=null;
			}
			super.clear();
		}
		
		public function clearSelectImage():void
		{
			if( _selectImage && _selectImage.parent )
			{
				_selectImage.parent.removeChild( _selectImage );
				_selectImage.dispose();
				_selectImage = null;
				
				removeEventListener( TouchEvent.TOUCH, onTouchSelect );
			}
		}
		
		protected function onTouchSelect( e:TouchEvent ):void
		{
			var mousePoint : Point = this.globalToLocal(new Point(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY))
			
			var currentTarget:DisplayObject = e.currentTarget as DisplayObject;
			var touch:Touch = e.getTouch( currentTarget );
			if( touch == null || !hitTest(mousePoint) )
			{
				if( _selectImage != null && isShow )
					_selectImage.visible = false;
				
				return;
			}
			
			touch = e.getTouch( currentTarget, TouchPhase.HOVER ); 
			if( touch != null )
			{
				if( _selectImage != null && isShow )
				{
					_selectImage.visible = true;
					_selectImage.x = _iconPositionX;
					_selectImage.y = _iconPositionY;
					addChild(_selectImage);
				}
			}
		}

		public function get alwayShowCount():Boolean
		{
			return _alwayShowCount;
		}

	}
}
