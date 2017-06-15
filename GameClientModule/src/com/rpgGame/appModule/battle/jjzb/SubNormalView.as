package com.rpgGame.appModule.battle.jjzb
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
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
		private var _eff:Inter3DContainer;
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
			playSuccessEff();
		}
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		public function playSuccessEff():void
		{
			if (!_eff) 
			{
				_eff=new Inter3DContainer();
				this.btnBack.addChild(_eff);
				_eff.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JJBATTLE),232/2,0,0,null,addEft);
			}
			
		}
		public function hide():void
		{
			this.gNormal.visible=false;
			this.btnBack.visible=false;
			for each (var player:JJBattlePlayerMediator in players) 
			{
				player.clearModel();
			}
			if (_eff) 
			{
				_eff.dispose();
				MCUtil.removeSelf(_eff);
				_eff=null;
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