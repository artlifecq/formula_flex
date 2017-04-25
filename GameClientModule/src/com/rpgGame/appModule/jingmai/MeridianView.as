package com.rpgGame.appModule.jingmai
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.appModule.jingmai.sub.MeridianMap;
	import com.rpgGame.appModule.jingmai.sub.TweenScaleScrollUitlExt;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.info.meridian.MeridianVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
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
	
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Event;

	public class MeridianView
	{
		private var tweenScroll:TweenScaleScrollUitlExt;
		private var _skin:Jingmai_Skin;
		
		private var sbtnArr:Array;
		private var _mapsHash:HashMap;
		private var _attrView:MeridianAttrViewPanelExt;
		private var _container:DisplayObjectContainer;
		public function MeridianView(skin:Jingmai_Skin,con:DisplayObjectContainer)
		{
			//tweenScroll=new TweenScaleScrollUitlExt(con,
			this._container=con;
			this._skin=skin;
			sbtnArr=[_skin.rdo_renmai,_skin.rdo_dumai,_skin.rdo_chongmai,_skin.rdo_daimai,_skin.rdo_yinqiaomai,_skin.rdo_yangqiaomai];
			for each (var sbtn:Radio in sbtnArr) 
			{
				sbtn.addEventListener(Event.TRIGGERED,onTriggered);
			}
			_attrView=new MeridianAttrViewPanelExt(_skin.Num_zhandouli);
			_attrView.x=940;
			_attrView.y=32;
			_container.addChild(_attrView);
			initData();
			
			//MeridianSender.reqMeridianInfo();
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
			for (var i:int = 0; i < len; i++) 
			{
				meridianType=keys[i];
				tmp=new MeridianMap(getSkinn(meridianType),meridianType,hash.getValue(meridianType));
				content.addChild(tmp);
				tmp.pos=i;
				tmp.x=startX*(i+1);
				tmp.y=225;
				tmp.updataServerData(hashData.getValue(meridianType));
				_maps.push(tmp);
				_mapsHash.put(meridianType,tmp);
			}
			tweenScroll=new TweenScaleScrollUitlExt(content,_maps,_skin.btn_prev,_skin.btn_next,0.5,_skin.imgBg.width,_skin.imgBg.height,startX);
			tweenScroll.setCallBack(tweenCompleteCallBack);
			_skin.mc_name.gotoAndStop(0);
			this._skin.chk_dengji.isSelected=true;
			this._skin.chk_shuxing.isSelected=true;
			this._skin.btn_hecheng.addEventListener(Event.TRIGGERED,onHeCheng);
			this._skin.chk_shuxing.addEventListener(Event.CHANGE,showHideAttr);
			this._skin.chk_dengji.addEventListener(Event.CHANGE,showHideLv);
			_attrView._skin.btnClose.addEventListener(Event.TRIGGERED,onCloseAttr);
		}
		
		private function onCloseAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			this._skin.chk_shuxing.isSelected=false;
		}
		
		private function showHideLv(eve:Event):void
		{
			// TODO Auto Generated method stub
			_mapsHash.eachValue(function(map:MeridianMap):void{
				map.showHideLv(_skin.chk_dengji.isSelected);
			});
			
		}
		private function clearEffect():void
		{
			// TODO Auto Generated method stub
			_mapsHash.eachValue(function(map:MeridianMap):void{
				map.hideEffect();
			});
			
		}
		private function showHideAttr(eve:Event):void
		{
			// TODO Auto Generated method stub
			_attrView.visible=_skin.chk_shuxing.isSelected;
		}
		
		private function onHeCheng(eve:Event):void
		{
			// TODO Auto Generated method stub
			
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
			Mgr.meridianMgr.addEventListener(MeridianEvent.ALL_DATA_UPATE,onGetAllData);
			Mgr.meridianMgr.addEventListener(MeridianEvent.MERIDIAN_CHANGE,onDataChange);
			onZhenQiChange(CharAttributeType.RES_ZHENQI);
		}
		
		private function onLevelChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			if (CharAttributeType.LV==type)
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
		private function onZhenQiChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			if (CharAttributeType.RES_ZHENQI==type) 
			{
				_skin.lb_zhenqi.text=MainRoleManager.actorInfo.curZhenqi.toString();
			}
			checkForUpdate();
		}
		public function onHide():void
		{
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onZhenQiChange);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,onLevelChange);
			Mgr.meridianMgr.removeEventListener(MeridianEvent.ALL_DATA_UPATE,onGetAllData);
			Mgr.meridianMgr.removeEventListener(MeridianEvent.MERIDIAN_CHANGE,onDataChange);
			clearEffect();
		}
	}
}