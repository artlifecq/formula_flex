package com.rpgGame.app.ui.alert
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.UIUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	
	import flash.utils.getTimer;
	
	import org.mokylin.skin.common.alert.AlertNewWeapon;
	
	import starling.display.DisplayObject;
	
	/**
	 * 获得装备提示自动装备功能 
	 * @author wewell
	 */	
	public class AutoDressAlert extends SkinUI
	{
		private static var _ins:AutoDressAlert;;
		
		private var skin:AlertNewWeapon
		private var okFCallBack:Function;
		private var closeCallBack:Function;
		private var equips:Array;
		private  var equipIcon:IconCDFace;
		private var gameTimer:GameTimer;
		private const TIME_OUT:int=8000;
		private var BLACK_TIME:int=5*60*1000;
		private var endTime:int=0;
		private var noticeStr:String="立即穿戴({0})";
		//点了关闭按钮五分钟之内不在提示
		private var blackHash:HashMap=new HashMap();
	
		public function AutoDressAlert()
		{
			skin = new AlertNewWeapon(); 
			super(skin);
			
			skin.icons.touchGroup=false;
			skin.icons.touchable=true;
			equips = [];
			gameTimer=new GameTimer("AutoDressAlert",1000,0,onTimer);
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var diff:int=(endTime-getTimer())/1000;
			if (diff<=0) 
			{
				onTouchTarget(skin.btn_ok);
				
			}
			else
			{
				this.skin.btn_ok.label=LanguageConfig.replaceStr(noticeStr,[diff]);
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target){
				case skin.btn_ok:
					gameTimer.stop();
					if(okFCallBack != null)
					{
						okFCallBack(equipIcon.faceInfo);
					}
					checkShowNext();
					break;
				case skin.btnClose:
					gameTimer.stop();
					blackHash.put((equipIcon.faceInfo as EquipInfo).itemInfo.itemId.hexValue,getTimer());
					checkShowNext();
					break;
			}
		}
		
		private function checkShowNext():void
		{
			if(equips && equips.length)
			{
				var tmp:EquipInfo=equips.shift();
				if (checkIsInBlack(tmp.itemInfo.itemId.hexValue)) 
				{
					checkShowNext();
					return;
				}
				setEquip(tmp);
			}else{
				hide();
			}
		}
		
		public function setEquip(equip:EquipInfo):void
		{
			//skin.lbl_name.htmlText=ItemQualityType.getHtmlEquipQualityEvaluteName(equip.refined_times, equip.quality, equip.name, equip.evaluate);
			skin.lbl_name.htmlText=ItemConfig.getItemName(equip.qItem.q_id);
			skin.lbl_name.color=ItemConfig.getItemQualityColor(equip.qItem.q_id);
			FaceUtil.SetItemGrid(equipIcon, equip);
			var power:int=equip.itemInfo.fightPower;
			var equ:ClientItemInfo=RoleEquipmentManager.instance.getEquipByPos(equip.qItem.q_kind);
			var nowp:int=0;
			if (equ) 
			{
				nowp=equ.itemInfo.fightPower;
			}
			skin.NumZhanli.label=(power-nowp)+"";
			skin.uiUP.x=skin.NumZhanli.x+skin.NumZhanli.width+8;
			endTime=getTimer()+TIME_OUT;
			if (gameTimer.running==false) 
			{
				gameTimer.start();
			}
			skin.btn_ok.label=LanguageConfig.replaceStr(noticeStr,[TIME_OUT/1000])
		}
		
		public function addEquip(equip:EquipInfo):void
		{
			var hex:String=equip.itemInfo.itemId.hexValue;
			if (checkIsInBlack(hex)) 
			{
				return;
			}
			var len:int = equips.length;
			var eq:EquipInfo;
			for(var i:int=0; i<len; i++)
			{
				eq = equips[i];
				if(!eq)
					continue;
				if(eq.equipPos != equip.equipPos )
				{
					continue;
				}
				if(equip.itemInfo.fightPower <=eq.itemInfo.fightPower)
				{
					return;
				}
				//直接替换吧一个部位只保存一个
				equips[i]=equip;
				return;
			}
			
			equips.push(equip);
		}
		private function checkIsInBlack(hex:String):Boolean
		{
			var time:int=blackHash.getValue(hex);
			if (time==0) 
			{
				return false;
			}
			if (getTimer()-time<BLACK_TIME) 
			{
				return true;
			}
			blackHash.remove(hex);
			return false;
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			UIUtil.alignToStageRightBottom(this);
		}
		
		public static function show(equip:EquipInfo, onOk:Function=null):AutoDressAlert
		{
			
			if(!_ins)
			{
				_ins = new AutoDressAlert;
			}
			if(_ins.checkIsInBlack(equip.itemInfo.itemId.hexValue))
			{
				return _ins;
			}
			_ins.okFCallBack = onOk;
			if(_ins.stage == null)
			{
				StarlingLayerManager.appUILayer.addChild(_ins);
				UIUtil.alignToStageRightBottom(_ins);
				_ins.setEquip(equip);
			}else
			{
				_ins.addEquip(equip);
			}
			return _ins;
		}
		
		public static function hide():void
		{
			if(_ins)_ins.removeFromParent();
		}
		
		override protected function onShow():void
		{
			super.onShow();
			equipIcon=IconCDFace.create(IcoSizeEnum.ICON_64);
			skin.icons.addChild(equipIcon);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			gameTimer.stop();
			equipIcon.destroy();
			equipIcon=null;
		}
	}
}



