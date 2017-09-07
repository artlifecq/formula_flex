package com.rpgGame.appModule.jingmai
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.appModule.jingmai.sub.JinMaiBtnEffect;
	import com.rpgGame.appModule.jingmai.sub.MeridianMap;
	import com.rpgGame.appModule.jingmai.sub.TweenScaleScrollUitlExt;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.IRewardCheck;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.meridian.MeridianVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.jingmai.Chongmai_Skin;
	import org.mokylin.skin.app.beibao.jingmai.Daimai_Skin;
	import org.mokylin.skin.app.beibao.jingmai.Dumai_Skin;
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Skin;
	import org.mokylin.skin.app.beibao.jingmai.Renmai_Skin;
	import org.mokylin.skin.app.beibao.jingmai.Yangqiaomai_Skin;
	import org.mokylin.skin.app.beibao.jingmai.yinqiaomai_Skin;
	
	import starling.display.Sprite;

	public class MeridianView
	{
		private var tweenScroll:TweenScaleScrollUitlExt;
		private var _skin:Jingmai_Skin;
		
		private var sbtnArr:Array;
		private var _mapsHash:HashMap;
		private var _attrView:MeridianAttrViewPanelExt;
		private var _container:SkinUI;
		private var _effect3dCon:Inter3DContainer;
		private var _effect3d:InterObject3D;
		private var _btnEffectArr:Array=[];
		private var _curEffect:JinMaiBtnEffect;
		public function MeridianView()
		{
			//tweenScroll=new TweenScaleScrollUitlExt(con,
		
			
			//MeridianSender.reqMeridianInfo();
		}
		public function setUi(skin:Jingmai_Skin,con:SkinUI):void
		{
			this._container=con;
			this._skin=skin;
			sbtnArr=[_skin.rdo_renmai,_skin.rdo_dumai,_skin.rdo_chongmai,_skin.rdo_daimai,_skin.rdo_yinqiaomai,_skin.rdo_yangqiaomai];
			var id:int=1;
			for each (var sbtn:Radio in sbtnArr) 
			{
				sbtn.addEventListener(Event.TRIGGERED,onTriggered);
				_btnEffectArr.push(new JinMaiBtnEffect(sbtn,id));
				id++;
			}
			_attrView=new MeridianAttrViewPanelExt(_skin.NumZhanli);
			_attrView.x=955;
			_attrView.y=42;
			_container.addChild(_attrView);
			initData();
		}
		protected function onGetAllData(event:MeridianEvent):void
		{
			// TODO Auto-generated method stub
			var data:MeridianVo=Mgr.meridianMgr.vo;
			var hash:HashMap=data.meridianHash;
			var keys:Array=hash.keys();
			var tmp:Array;
			var map:MeridianMap;
			for each (var key:int in keys) 
			{
				tmp=hash.getValue(key);
				map=_mapsHash.getValue(key);
				if (tmp&&map) 
				{
					map.updataServerData(tmp);
				}
			}
			
		}
		
		protected function onDataChange(event:MeridianEvent):void
		{
			// TODO Auto-generated method stub
			//先更新单个数据在更新关联数据
			var data:AcuPointInfo=event.data;
			if (data) 
			{
				var map:MeridianMap=_mapsHash.getValue(data.MeridId);
				if (map) 
				{
					map.updataServerData([data],true);
				}
				_mapsHash.eachValue(function(map:MeridianMap):void{
					map.checkCareDataUpdate(data);
				});
				Mgr.meridianMgr.dispatchEvent(new MeridianEvent(MeridianEvent.MERDIAN_UPDATE_TIP,data));
			}
		}
		
		private function onTriggered(eve:Event):void
		{
			// TODO Auto Generated method stub
			var target:Radio=eve.target as Radio;
			if (target) 
			{
				var index:int=sbtnArr.indexOf(target);
				if (index>=0) 
				{
					tweenScroll.scroll2Index(index);
				}
			}
		}
		private function initData():void
		{
			//选取等级为1的数据
			var hash:HashMap=MeridianCfg.getInitCfg();
			var keys:Array=hash.keys();
			_effect3dCon=new Inter3DContainer();
			_skin.imgBg.addChild(_effect3dCon);
			_effect3dCon.x=_skin.imgBg.width/2;
			_effect3dCon.y=_skin.imgBg.height/2;
			var content:Sprite=new Sprite();
			_skin.imgBg.addChild(content);
			_skin.imgBg.touchGroup=false;
			var len:int=keys.length;
			var _maps:Array=[];
			var tmp:MeridianMap;
			var startX:int=_skin.imgBg.width/2+5;
			var hashData:HashMap=Mgr.meridianMgr.vo.meridianHash;
			_mapsHash=new HashMap();
			var meridianType:int=0;
			var nodeKeys:Array=[RTNodeID.JM_RENM,RTNodeID.JM_DUM,RTNodeID.JM_CHONGM,RTNodeID.JM_DAIM,RTNodeID.JM_YINGM,RTNodeID.JM_YANGM];
			for (var i:int = 0; i < len; i++) 
			{
				meridianType=keys[i];
				tmp=new MeridianMap(getSkinn(meridianType),meridianType,hash.getValue(meridianType),nodeKeys[i]);
				_mapsHash.put(meridianType,tmp);
				content.addChild(tmp);
				tmp.pos=i;
				tmp.x=startX*(i+1);
				tmp.y=225;
				tmp.updataServerData(hashData.getValue(meridianType));
				_maps.push(tmp);
				
			}
			tweenScroll=new TweenScaleScrollUitlExt(content,_maps,_skin.btn_prev,_skin.btn_next,0.5,_skin.imgBg.width,_skin.imgBg.height,startX);
			tweenScroll.setCallBack(tweenCompleteCallBack);
			_skin.mc_name.gotoAndStop(0);
	
			this._skin.btn_hecheng.addEventListener(Event.TRIGGERED,onHeCheng);
			this._skin.btnOpen.addEventListener(Event.TRIGGERED,showAttr);
			this._skin.btnClose.addEventListener(Event.TRIGGERED,hideAttr);
			_attrView._skin.btnClose.addEventListener(Event.TRIGGERED,onCloseAttr);
			showAttr(null);
		}
		
		private function onCloseAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			//this._skin.chk_shuxing.isSelected=false;
			hideAttr(null);
		}
		
		
		private function clearEffect():void
		{
			// TODO Auto Generated method stub
			_mapsHash.eachValue(function(map:MeridianMap):void{
				map.hideEffect();
			});
			if (_effect3d) 
			{
				_effect3d.dispose();
				_effect3d=null;
			}
			if (_curEffect) 
			{
				_curEffect.clearEffect();
				_curEffect=null;
			}
		}
		private function showAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			_attrView.visible=true;
			_skin.btnOpen.visible=false;
			_skin.btnClose.visible=true;
		}
		private function hideAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			_attrView.visible=false;
			_skin.btnOpen.visible=true;
			_skin.btnClose.visible=false;
		}
		private function onHeCheng(eve:Event):void
		{
			// TODO Auto Generated method stub
			//AppManager.showAppNoHide(AppConstant.EQUIP_PANL,{tab:EmFunctionID.EM_HECHENG});
			FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_HECHENG);
		}
		
		private function tweenCompleteCallBack(map:*):void
		{
			// TODO Auto Generated method stub
			var btn:Radio=sbtnArr[MeridianMap(map).pos];
			if (btn) 
			{
				btn.isSelected=true;
			}
			_skin.mc_name.gotoAndStop(sbtnArr.indexOf(btn));
			if (_curEffect) 
			{
				_curEffect.clearEffect();
			}
			_curEffect=_btnEffectArr[MeridianMap(map).pos];
			if (_curEffect) 
			{
				_curEffect.showEffect();
			}
		}
		
		private function getSkinn(meridianType:int):StateSkin
		{
			if (meridianType==1) 
			{
				return new Renmai_Skin();
			}
			else if (meridianType==2) 
			{
				return new Dumai_Skin();
			}
			else if (meridianType==3) 
			{
				return new Chongmai_Skin();
			}
			else if (meridianType==4) 
			{
				return new Daimai_Skin();
			}
			else if (meridianType==5) 
			{
				return new yinqiaomai_Skin();
			}
			else if (meridianType==6) 
			{
				return new Yangqiaomai_Skin();
			}
			return null;
		}
		public function onShow():void
		{
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onZhenQiChange);
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,onLevelChange);
			EventManager.addEvent(ItemEvent.ITEM_ADD,onAddItem);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onAddItem);
			Mgr.meridianMgr.addEventListener(MeridianEvent.ALL_DATA_UPATE,onGetAllData);
			Mgr.meridianMgr.addEventListener(MeridianEvent.MERIDIAN_CHANGE,onDataChange);
			
			onZhenQiChange(CharAttributeType.RES_ZHENQI);
			_effect3d=_effect3dCon.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JINGMAI_STAR),0,0,0,null,addEft);
			_curEffect=_btnEffectArr[tweenScroll.curIndex];
			if (_curEffect) 
			{
				_curEffect.showEffect();
			}
		}
		
		private function onAddItem(itemInfo : ClientItemInfo):void
		{
			// TODO Auto Generated method stub
			if (itemInfo&&itemInfo.qItem) 
			{
				if (itemInfo.qItem.q_type==GoodsType.MERIDIANSTONE) 
				{
					checkForUpdateJX();
				}
			}
		}
		
		private function onLevelChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			//if (CharAttributeType.LV==type)
			{
				checkForUpdate();
			}
		}
		private function checkForUpdate():void
		{
			var keys:Array=_mapsHash.keys();
			var tmp:Array;
			var map:MeridianMap;
			for each (var key:int in keys) 
			{
				map=_mapsHash.getValue(key);
				if (map) 
				{
					map.checkForUpdate();
				}
			}
		}
		private function checkForUpdateJX():void
		{
			var keys:Array=_mapsHash.keys();
			var tmp:Array;
			var map:MeridianMap;
			for each (var key:int in keys) 
			{
				map=_mapsHash.getValue(key);
				if (map) 
				{
					map.checkForUpdateJX();
				}
			}
		}
		private function onZhenQiChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			if (CharAttributeType.RES_ZHENQI==type) 
			{
				_skin.lb_zhenqi.text=MainRoleManager.actorInfo.curZhenqi.toString()+"/"+MainRoleManager.actorInfo.maxZhenqi;
				_skin.proZhenqi.maximum=MainRoleManager.actorInfo.maxZhenqi;
				_skin.proZhenqi.value=MainRoleManager.actorInfo.curZhenqi;
			}
			checkForUpdate();
		}
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		public function onHide():void
		{
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onZhenQiChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,onLevelChange);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onAddItem);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onAddItem);
			Mgr.meridianMgr.removeEventListener(MeridianEvent.ALL_DATA_UPATE,onGetAllData);
			Mgr.meridianMgr.removeEventListener(MeridianEvent.MERIDIAN_CHANGE,onDataChange);
			clearEffect();
		}
		private function checkSub(merdianId:int):Boolean
		{
			var map:IRewardCheck=_mapsHash.getValue(merdianId) as IRewardCheck;
			if (map) 
			{
				return map.hasReward();
			}
			return false;
		}
	
		public function checkRenM():Boolean
		{
			return checkSub(1);
		}
		public function checkDuM():Boolean
		{
			return checkSub(2);
		}
		public function checkChongM():Boolean
		{
			return checkSub(3);
		}
		public function checkDaiM():Boolean
		{
			return checkSub(4);
		}
		
		public function checkYinM():Boolean
		{
			return checkSub(5);
		}
		public function checkYangM():Boolean
		{
			return checkSub(6);
		}
	}
}