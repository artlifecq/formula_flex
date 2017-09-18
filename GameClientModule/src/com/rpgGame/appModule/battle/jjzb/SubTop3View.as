package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.netData.zhengba.bean.ZhengBaBriefInfo;
	import com.rpgGame.netData.zhengba.bean.ZhengBaData;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.zhanchang.jingjichang.RoleItem2;

	public class SubTop3View implements ISubBattleView
	{
		private var gTop:Group;
		private var topArr:Array;
		private var btnBack:Button;
		private var players:Vector.<JJBattlePlayerMediator>;
		private var _bg:UIAsset;
		public function SubTop3View(bg:UIAsset,g:Group,top:Array,backBtn:Button)
		{
			this.gTop=g;
			this.topArr=top;
			this.gTop.visible=false;
			this.btnBack=backBtn;
			this._bg=bg;
			this._bg.visible=false;
			players=new Vector.<JJBattlePlayerMediator>();
			var len:int=top.length;
			var tmp:JJBattlePlayerMediator;
			var skin:RoleItem2;
			for (var i:int = 0; i < len; i++) 
			{
				skin=(topArr[i] as SkinnableContainer).skin as RoleItem2;
				tmp=new JJBattlePlayerMediator(2,topArr[i],skin.imgCon,null,skin.lbLevel,skin.lbName,skin.numZhanli,1.4);
				players.push(tmp);
			}
			hide();
		}
		
		public function show():void
		{
			gTop.visible=true;
			this._bg.visible=true;
			this.btnBack.visible=true
			Mgr.jjBattleMgr.reqChallegeRankData(2);
		}
		
		public function hide():void
		{
			gTop.visible=false;
			this._bg.visible=false;
			this.btnBack.visible=false
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