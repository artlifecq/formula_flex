package com.rpgGame.appModule.junjie
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.JunJieEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.coreData.clientConfig.Q_junjie;
	import com.rpgGame.coreData.utils.JunJieUtil;
	import com.rpgGame.netData.junjie.bean.JunJieConditionInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.junjie.ShuXing_Item2;
	
	import starling.display.DisplayObject;
	
	public class TiaoJianItem extends SkinUI
	{
		private var _skin:ShuXing_Item2;
		
		private var _id:int;
		private var _info:JunJieConditionInfo;
		private var _iswancheng:Boolean;
		private var _q_junjie:Q_junjie;
		private var _gongnengId:int=0;
		public function TiaoJianItem()
		{
			_skin=new ShuXing_Item2();
			super(_skin);
		}
		
		public function get iswancheng():Boolean
		{
			return _iswancheng;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			//			EventManager.addEvent(JunJieEvent.JUNJIE_CHANGE,updateInfo);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			//			EventManager.removeEvent(JunJieEvent.JUNJIE_CHANGE,updateInfo);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.lbName:
					FunctionOpenManager.openAppPaneById(_gongnengId.toString());
					break;
			}
		}
		
		public function setData(id:int,info:JunJieConditionInfo):void
		{
			_id=id;
			_info=info;	
			showTiaojian();
			_q_junjie=JunJieData.getModByLv(_id);
			_gongnengId=JunJieUtil.getIDByTiaoJianType(_info.type);
		}
		
		private function showTiaojian():void
		{
			_skin.lbNum.text=_info.currentValue+"/"+_info.maxValue;
			if(_info.currentValue>=_info.maxValue){
				_skin.lbName.text=JunJieUtil.getStrByTiaoJianType(_info.type);
				_skin.lbWancheng.color=0x5CB006;
				_skin.lbWancheng.text="已完成";
				_iswancheng=true;
			}
			else{
				_skin.lbName.text=JunJieUtil.getStrByTiaoJianType(_info.type)+" >>";
				_skin.lbWancheng.color=0xd02525;
				_skin.lbWancheng.text="未完成";
				_iswancheng=false;
			}
		}
		
		public function updateInfo():void
		{
			if(_info!=null)
			{
				_info=Mgr.junjieMgr.getConditionInfoByType(_id,_info.type);
				showTiaojian();
			}
		}
	}
}