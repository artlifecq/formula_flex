package com.rpgGame.app.view.icon
{
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.uiComponent.face.cd.CDData;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataEvent;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.core.view.uiComponent.face.cd.CDFace;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.IBaseFaceInfo;
	
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import feathers.dragDrop.IDragSource;
	import feathers.dragDrop.IDropTarget;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.events.Event;
	import starling.text.TextField;
	import starling.text.TextFormat;

	/**
	 * 1、带cd的ico
	 * 2、显示快捷键
	 *
	 *
	 * @author fly.liuyang
	 * 创建时间：2014-8-20 下午4:34:39
	 *
	 */
	public class IconCDFace extends BgIcon implements IDragSource, IDropTarget
	{
		protected var _faceInfo : IBaseFaceInfo;

		public var _cdFace : CDFace;
		private var _needCD : Boolean = false;
		protected var _isGary : Boolean = false;
		private var _showCD : Boolean = true;
		
		/** 是否已经侦听cd事件*/
		private var _isAlreadyListenerCd : Boolean;
		/** 显示快捷键 */
		private var _shortcutKeyLab : TextField;
		public var isCircleCD : Boolean = false;
		public var isReverse : Boolean = false;

		/**
		 * 图标尺寸
		 * @param $iconSize		参考：IcoSizeEnum
		 *
		 */
		public function IconCDFace($iconSize : int)
		{
			super($iconSize);

			sortLayer();
		}

		public function get cdFace():CDFace
		{
			return _cdFace;
		}

		private function onAddToStg(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStg);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStg);
			//
			if (_needCD)
				addCdEvent();
			else
				removeCdEvent();
		}

		private function onRemoveFromStg(event : Event) : void
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStg);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStg);

			removeCdEvent();
			removeCDFace();
		}

		/**----------------------------------------------------------------------------------*/
		/**
		 * 得到CD的剩余时间
		 * @return
		 *
		 */
		public function get lostCdTm() : int
		{
			if (_faceInfo != null)
			{
				return CDDataManager.getCdLostTm(_faceInfo.coolID);
			}
			return 0;
		}

		//------------------------------------------------CD实现------------------------------------------------
		public function get coolID() : String
		{
			if (_faceInfo == null)
			{
				return "";
			}
			return _faceInfo.coolID;
		}

		public function get faceID() : *
		{
			if (_faceInfo == null)
			{
				return 0;
			}
			return _faceInfo.cfgId;
		}

		public function get faceInfo() : IBaseFaceInfo
		{
			return _faceInfo;
		}

		public function set faceInfo(value : IBaseFaceInfo) : void
		{
			if (value == null)
				return;

			if (value == _faceInfo)
				return;

			_faceInfo = value;

			registerCD();
		}


		protected function registerCD() : void
		{
			removeCDFace();
			addEventListener(Event.ADDED_TO_STAGE, onAddToStg);

			needCD = true;
		}

		public function set needCD(value : Boolean) : void
		{
			_needCD = value;
			if (value)
			{
				//不在舞台上就不需要显示cd，
				//itemface被添加舞台上时会自动添加cd侦听
				if (stage != null)
				{
					addCdEvent();
				}
			}
			else
			{
				removeCdEvent();
			}
		}

		public function addCdEvent() : void
		{
			if (!_isAlreadyListenerCd)
			{
				_isAlreadyListenerCd = true;
				EventManager.addEvent(CDDataEvent.UPDATE, onCdUpdate);
				EventManager.addEvent(CDDataEvent.COMPLETE, onCdComplete);
			}
		}

		public function removeCdEvent() : void
		{
			_isAlreadyListenerCd = false;
			EventManager.removeEvent(CDDataEvent.UPDATE, onCdUpdate);
			EventManager.removeEvent(CDDataEvent.COMPLETE, onCdComplete);
		}

		private function onCdUpdate(cdData : CDData) : void
		{
			if (_faceInfo != null && cdData.id == _faceInfo.coolID&&_showCD)
			{
				cdUpdate(cdData.now, cdData.cd);
			}
		}

		private function onCdComplete(cdData : CDData) : void
		{
			if (_faceInfo != null && cdData.id == _faceInfo.coolID&&_showCD)
			{
				removeCDFace();
				cdComplete();
			}
		}

		public function cdComplete():void
		{
			
		}
		public function removeCDFace() : void
		{
			if (_cdFace)
			{
				CDFace.recyle(_cdFace);
				_cdFace.parent.removeChild(_cdFace);
				_cdFace = null;
			}
		}

		public function cdUpdate($now : Number, $cdTotal : Number) : void
		{
			if (!_cdFace || !_cdFace.parent)
				addCdFace();

			_cdFace.update($now, $cdTotal);
		}

		public function addCdFace() : void
		{
			if (_cdFace == null)
			{
				_cdFace = CDFace.create(_iconSize, _iconSize, null, isCircleCD, isReverse);

				if (_iconImage != null)
				{
					_cdFace.x = _iconImage.x;
					_cdFace.y = _iconImage.y;
				}
			}
			setIsShowCdTm(_isShwoTm);
			_cdFace.setTimeTxt("");
			addChild(_cdFace);
		}

		/**
		 * 显示快捷栏提示
		 * @param value			显示内容
		 *
		 */
		public function showShortCutText(value : String) : void
		{
			if (_shortcutKeyLab == null)
			{
				_shortcutKeyLab = new TextField(40, 20, "");
				_shortcutKeyLab.touchable = false;
				_shortcutKeyLab.autoSize = TextFieldAutoSize.LEFT;
				var tf:starling.text.TextFormat=new starling.text.TextFormat();
				tf.horizontalAlign="left";
				_shortcutKeyLab.format=tf;
				_shortcutKeyLab.color = StaticValue.COLOR_CODE_4;
			}
			_shortcutKeyLab.x=5;
			_shortcutKeyLab.y=5;
			_shortcutKeyLab.text = value;
			addChild(_shortcutKeyLab);
		}

		private var _isShwoTm : Boolean = false;

		public function setIsShowCdTm(isShow : Boolean,txtFormat : flash.text.TextFormat = null) : void
		{
			_isShwoTm = isShow;
			if (_cdFace == null)
				return;

			if (isShow)
				_cdFace.showTmTxt(txtFormat);
			else
				_cdFace.hideTmTxt();
		}
		
		override public function sortLayer() : void
		{
			super.sortLayer();

			if (_cdFace != null)
				addChild(_cdFace);

			if (_shortcutKeyLab != null)
				addChild(_shortcutKeyLab);
		}

		public function set isGary(value : Boolean) : void
		{
			_isGary=value;
			if (_iconImage == null)
				return;

			if (value)
			{
				GrayFilter.gray(_iconImage);
			}
			else
			{
				_iconImage.filter = null;
			}
		}
		public function get isGary() : Boolean
		{
			return _isGary;
		}
		/** 清空 只是把显示数据清除 并不全部销毁 * */
		override public function clear() : void
		{
			isGary = false;

			removeCdEvent();
			removeCDFace();

			count = 0;
			hideQuality();

			if (_cdFace != null)
			{
				_cdFace.dispose();
				_cdFace = null;
			}
			_faceInfo = null;

			TipTargetManager.remove(this);
			super.clear();
		}

		//-------------------------------------------

		private static var _icoFacePool : Array = [];

		public static function getIcoFace(size : int = IcoSizeEnum.SIZE_40) : IconCDFace
		{
			var icoFace : IconCDFace;
			if (_icoFacePool.length > 0)
			{
				icoFace = _icoFacePool.pop();
			}
			else
			{
				icoFace = new IconCDFace(size);
			}
			return icoFace;
		}

		public static function releaseIcoFace(iconFace : IconCDFace) : void
		{
			if (iconFace == null)
				return;
			//			iconFace.isShowQualityEffect(false);
			iconFace.removeFromParent();

			_icoFacePool.push(iconFace);
			iconFace.x = 0;
			iconFace.y = 0;
			iconFace.alpha = 1;
			iconFace.faceInfo = null;
			iconFace.filter = null;
			iconFace.touchable = true;
			iconFace.touchGroup = true;
			iconFace.setBg("");
			iconFace.clear();
		}

		public function get showCD():Boolean
		{
			return _showCD;
		}

		public function set showCD(value:Boolean):void
		{
			_showCD = value;
		}


	}
}
