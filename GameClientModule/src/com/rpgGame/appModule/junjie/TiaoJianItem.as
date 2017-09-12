package com.rpgGame.appModule.junjie
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.coreData.clientConfig.Q_junjie;
	import com.rpgGame.coreData.clientConfig.Q_junjie_condition;
	import com.rpgGame.coreData.utils.JunJieUtil;
	import com.rpgGame.netData.junjie.bean.JunJieConditionInfo;
	
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
			_skin.lbName.width=150;
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
					FunctionOpenManager.openPanelByFuncID(_gongnengId);
					break;
			}
		}
		
		public function setData(id:int,info:JunJieConditionInfo):void
		{
			_id=id;
			_info=info;	
			showTiaojian();
			_q_junjie=JunJieData.getModByLv(_id);
			var condInfo:Q_junjie_condition=JunJieData.getConditionByType(_info.type);
			if(condInfo!=null)
			{
				_gongnengId=condInfo.q_emid;
			}
			else
			{
				GameLog.addShow("策划没有配置对应的条件：："+_info.type);
			}
		}
		
		private function showTiaojian():void
		{
			_skin.lbNum.text=_info.currentValue+"/"+_info.maxValue;
			var condInfo:Q_junjie_condition=JunJieData.getConditionByType(_info.type);
			if(condInfo!=null)
			{
				if(_info.currentValue>=_info.maxValue){
					_skin.lbName.text=condInfo.q_name;
					_skin.lbWancheng.color=0x5CB006;
					_skin.lbWancheng.text="已完成";
					_iswancheng=true;
				}
				else{
					_skin.lbName.text=condInfo.q_name+" >>";
					_skin.lbWancheng.color=0xd02525;
					_skin.lbWancheng.text="未完成";
					_iswancheng=false;
				}
			}
			else
			{
				GameLog.addShow("策划没有配置对应的条件：："+_info.type);
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