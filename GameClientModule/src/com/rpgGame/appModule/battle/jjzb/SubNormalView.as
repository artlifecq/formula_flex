package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.netData.zhengba.bean.ZhengBaBriefInfo;
	import com.rpgGame.netData.zhengba.bean.ZhengBaData;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.zhanchang.jingjichang.RoleItem;

	public class SubNormalView implements ISubBattleView
	{
		private var gNormal:Group;
		private var normalArr:Array;
		private var btnBack:Button;
		private var players:Vector.<JJBattlePlayerMediator>;
		public function SubNormalView(g:Group,normal:Array,backBtn:Button)
		{
			this.gNormal=g;
			this.normalArr=normal;
			this.gNormal.visible=false;
			this.btnBack=backBtn;
			players=new Vector.<JJBattlePlayerMediator>();
			var len:int=normal.length;
			var tmp:JJBattlePlayerMediator;
			var skin:RoleItem;
			for (var i:int = 0; i < len; i++) 
			{
				skin=(normal[i] as SkinnableContainer).skin as RoleItem;
				tmp=new JJBattlePlayerMediator(1,normal[i],skin.imgCon,skin.uiGuan,skin.lbLevel,skin.lbName,skin.numZhanli,1.4);
				players.push(tmp);
			}
			hide();
		}
		
		public function show():void
		{
			this.gNormal.visible=true;
			this.btnBack.visible=true;
			Mgr.jjBattleMgr.reqChallegeRankData(1);
		}
		
		public function hide():void
		{
			this.gNormal.visible=false;
			this.btnBack.visible=false;
			for each (var player:JJBattlePlayerMediator in players) 
			{
				player.clearModel();
			}
			
		}
		private function sortPlayer(a:ZhengBaBriefInfo,b:ZhengBaBriefInfo):int
		{
			if (a.rank>b.rank) 
			{
				return 1;
			}
			else if (a.rank<b.rank) 
			{
				return -1;
			}
			return 0;
		}
		public function setData(data:*):void
		{
			for each (var player:JJBattlePlayerMediator in players) 
			{
				player.clearModel();
			}
			var list:Vector.<ZhengBaBriefInfo>=data;
			if (list) 
			{
				list=list.sort(sortPlayer);
				var len:int=list.length;
				for (var i:int = 0; i < len; i++) 
				{
					players[i].SetData(list[i]);
				}
			}
		}
	}
}