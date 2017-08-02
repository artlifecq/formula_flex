package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.RankListManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.RankListEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.netData.top.bean.TopInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.paihangbang.PaiHang_BaZhu;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class WorshipPanle extends SkinUIPanel
	{
		private var _skin:PaiHang_BaZhu;
		private var _avater:UIAvatar3D;
		private var _showAvatarData : RoleData;
		private var _topInfo:TopInfo;
		public function WorshipPanle():void
		{
			_skin = new PaiHang_BaZhu();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_avater = new UIAvatar3D(_skin.content,1.7);
			_showAvatarData = new RoleData(0);
			_showAvatarData.bodyRadius=25;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_topInfo = data as TopInfo;
			if(_topInfo == null)
				return ;
			_skin.lbName.text = _topInfo.playername;
			
			_avater.updateWithPlayerBriefInfo(_topInfo.playerBriefInfo);
			EventManager.addEvent(RankListEvent.UPDATAWORSHIPCOUNT,updataWorshipHandler);
			updataWorshipHandler();
		}
		
		private function updataWorshipHandler():void
		{
			var addexp:Number = mgr.glodAddPercent*100
			_skin.lbAdd.text = LanguageConfig.replaceStr("奖励加成$%",addexp);
			_skin.lbAdd.visible = addexp >0;
			_skin.lbPutong.text = LanguageConfig.replaceStr("$ 经验",mgr.getExp);
			_skin.lbYuanbao.text = LanguageConfig.replaceStr("$ 经验",mgr.glodExp);
			
			_skin.lbJiacheng.text = LanguageConfig.replaceStr("（奖励加成 $)",mgr.glodAddExp);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnPutong:
					mgr.requesWorship(1);
					break;
				case _skin.btnYuanbao:
					mgr.requesWorship(2);
					break;
			}
		}
		
		private function get mgr():RankListManager
		{
			return RankListManager.instance;
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(RankListEvent.UPDATAWORSHIPCOUNT,updataWorshipHandler);
		}
	}
}