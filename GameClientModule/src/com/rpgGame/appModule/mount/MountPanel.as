package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zuoqi.Zuoqi_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MountPanel extends SkinUIPanel
	{
		private static var isMouseOut : Boolean = true;
		private var _skin:Zuoqi_Skin;
		private var _spellIconList:Vector.<IconCDFace>;
		private var _mountContent:MountContent;
		private var _propContent:MountProps;
		private var _mountupContent:MountUpExpConent;
		private var _mountShowData:MountShowData;
		private var _extraItemList:Vector.<ExtraButton>;
		public function MountPanel():void
		{
			_skin = new Zuoqi_Skin();
			super(_skin);
			init();
		}
		private function init():void
		{
			_mountShowData = new MountShowData();
			initView();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_mountShowData.horsedataInfo =  HorseManager.instance().horsedataInfo;
			_mountShowData.useExtraItem(0,0);
			_mountContent.refeashMode(_mountShowData.mountLevel);
			_propContent.updataInfo(_mountShowData);
			_propContent.refeashPropShow(false);
			_mountupContent.updataInfo(_mountShowData);
			refeashLevel();
			initEvent();
		}
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			var name : String = target.name;
			switch (name)
			{
				case "btn_kaishi":
					onMouseOut();
					break;
				case "btn_zidong":
					onMouseOut();
					break;
				case "btn_next":
					_mountContent.buttonRight();
					break;
				case "btn_prev":
					_mountContent.buttonLeft();
					break;
				case "btn_kaishi":
					if(_mountShowData.isSelf)
					{
						
					}
					break;
				case "btn_zidong":
					
					break;
				case "btn_tingzhi":
					
					break;
			}
		}
		private function initView():void
		{
			_spellIconList = new Vector.<IconCDFace>();
			var spellList:Vector.<BaseFaceInfo> = HorseManager.instance().spellList; 
			var icon:IconCDFace = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_1,IcoSizeEnum.ICON_64);
			FaceUtil.SetSkillGrid(icon, spellList[0], false);
			_spellIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_2,IcoSizeEnum.ICON_64);
			FaceUtil.SetSkillGrid(icon, spellList[1], false);
			_spellIconList.push(icon);
			icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.kuang_3,IcoSizeEnum.ICON_64);
			FaceUtil.SetSkillGrid(icon, spellList[2], false);
			_spellIconList.push(icon);
			
			_mountContent = new MountContent(_skin);
			_propContent = new MountProps(_skin);
			_mountupContent = new MountUpExpConent(_skin);
			_extraItemList = new Vector.<ExtraButton>();
			_extraItemList.push(new ExtraButton(_skin.btn_zizhidan,506));
			_extraItemList.push(new ExtraButton(_skin.btn_chengzhangdan,507));
		}
		private function initEvent():void
		{
			_skin.btn_kaishi.addEventListener(TouchEvent.TOUCH, onTouch);
			_skin.btn_zidong.addEventListener(TouchEvent.TOUCH, onTouch);
			EventManager.addEvent(HorseManager.HorseUpLevel,refeashLevel);
			EventManager.addEvent(HorseManager.HorseChangeExp,refeashLevel);
		}
		private function onTouch(e : TouchEvent) : void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				onMouseOut();
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				_mountContent.refeashMode(_mountShowData.mountLevel);
				onMouseOver();
				return;
			}
		}
		private function onMouseOver():void
		{
			_mountContent.playTarget(true);
			_propContent.refeashPropShow(true);
		}
		private function onMouseOut():void
		{
			_mountContent.playTarget(false);
			_propContent.refeashPropShow(false);
		}
		
		private function refeashLevel():void
		{
			_mountupContent.updataInfo(_mountShowData);
			_propContent.refeashPropValue();
			_mountContent.refeashMode(_mountShowData.mountLevel);
			for each(var eb:ExtraButton in _extraItemList)
			{
				eb.refeash(_mountShowData);
			}
		}
	}
}