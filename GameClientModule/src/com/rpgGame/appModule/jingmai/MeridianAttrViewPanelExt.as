package com.rpgGame.appModule.jingmai
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FightValueUtil;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.events.Event;
	import flash.geom.Point;
	
	import feathers.controls.Label;
	import feathers.controls.UINumber;
	
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Shuxin;
	
	public class MeridianAttrViewPanelExt extends SkinUI
	{
		public var _skin:Jingmai_Shuxin;
		private var _fightPower:UINumber;
		//缓存下来减少运算量
		private var _totalCHash:HashMap=new HashMap();
		private var _totalJHash:HashMap=new HashMap();
		private var labArr:Array=[];
		public function MeridianAttrViewPanelExt(uiNum:UINumber)
		{
			_skin=new Jingmai_Shuxin();
			super(_skin);
			MCUtil.removeSelf(_skin.lb_att0);
			MCUtil.removeSelf(_skin.ib_att1);
			this._fightPower=uiNum;
			Mgr.meridianMgr.addEventListener(MeridianEvent.ALL_DATA_UPATE,onUpdateAll);
			Mgr.meridianMgr.addEventListener(MeridianEvent.MERIDIAN_CHANGE,onMeridianChange);
			countAllAttr();
		}
		private function countAllAttr():void
		{
			_totalCHash.clear();
			_totalJHash.clear();
			
			var keys:Array=Mgr.meridianMgr.vo.meridianHash.keys();
			for each (var merId:int in keys) 
			{
				var tmpC:HashMap=new HashMap();
				var tmpJ:HashMap=new HashMap();
				calculateMeridianAttar(merId,tmpC,tmpJ);
				_totalCHash.put(merId,tmpC);
				_totalJHash.put(merId,tmpJ);
			}
			updateAttr();
		}
		protected function onMeridianChange(event:MeridianEvent):void
		{
			// TODO Auto-generated method stub
			var data:AcuPointInfo=event.data;
			if (data) 
			{
				var tmpc:HashMap=_totalCHash.getValue(data.MeridId);
				var tmpJ:HashMap=_totalJHash.getValue(data.MeridId);
				if (!tmpc) 
				{
					return;
				}
				if (!tmpJ) 
				{
					return;
				}
				tmpc.clear();
				tmpJ.clear();
				calculateMeridianAttar(data.MeridId,tmpc,tmpJ);
				updateAttr();
			}
		}
		private function updateAttr():void
		{
			var tmpC:HashMap=new HashMap();
			var tmpJ:HashMap=new HashMap();
			var keys:Array=_totalCHash.keys();
			for each (var key:int in keys) 
			{
				MCUtil.mergeValueHashMap(tmpC,_totalCHash.getValue(key));
			}
			keys=_totalJHash.keys();
			for each (var key2:int in keys) 
			{
				MCUtil.mergeValueHashMap(tmpJ,_totalJHash.getValue(key2))
			}
			for each (var lab:Label in labArr) 
			{
				MCUtil.removeSelf(lab);
			}
			labArr.length=0;
			var startPos:Point=new Point(_skin.lb_att0.x,_skin.lb_att0.y);
			labArr=AttrUtil.showAttr(tmpC,this,_skin.lb_att0,1,startPos,_skin.lb_att0.width,_skin.lb_att0.height+2);
			startPos.y=_skin.ib_att1.y;
			labArr=AttrUtil.showAttr(tmpJ,this,_skin.lb_att0,1,startPos,_skin.lb_att0.width,_skin.lb_att0.height+2);
			_fightPower.number=FightValueUtil.calFightPowerByHash(tmpC,MainRoleManager.actorInfo.job)+FightValueUtil.calFightPowerByHash(tmpJ,MainRoleManager.actorInfo.job);
		}
		protected function onUpdateAll(event:MeridianEvent):void
		{
			// TODO Auto-generated method stub
			countAllAttr();
		}
		private function calculateMeridianAttar(meriId:int,hashC:HashMap,hashJ:HashMap):void
		{
			
			var ret:Array=[hashC,hashJ];
			var serverData:Array=Mgr.meridianMgr.vo.getMeridianMapData(meriId);
			if (serverData) 
			{
				var qMeri:Q_meridian;
				for each (var acuInfo:AcuPointInfo in serverData) 
				{
					qMeri=MeridianCfg.getMeridianCfg(acuInfo.MeridId+"_"+acuInfo.acuPointId+"_"+acuInfo.level);
					//冲穴
					if (acuInfo.level>0&&qMeri.q_stone_attribute!=0) 
					{
						AttValueConfig.getTypeValue(qMeri.q_stone_attribute,hashC);
					}
					//
					else if (acuInfo.stone.length>0&&qMeri.q_stone_attribute!=0) 
					{
						AttValueConfig.getTypeValue(qMeri.q_stone_attribute,hashJ);
					}
				}	
			}
		}
		
	}
}