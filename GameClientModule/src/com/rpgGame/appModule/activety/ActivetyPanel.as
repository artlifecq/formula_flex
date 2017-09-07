package com.rpgGame.appModule.activety
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.activety.boss.BossView;
	import com.rpgGame.appModule.activety.jixiantiaozhan.JiXianTiaoZhanPenelExt;
	import com.rpgGame.appModule.activety.jixiantiaozhan.JiXianTiaozhanPaiHnagPenelExt;
	import com.rpgGame.appModule.activety.zonghe.ZongHeView;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.cfg.PanelCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.clientConfig.Q_panel;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.activety.Activety_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 *活动面板 
	 * @author dik
	 * 
	 */
	public class ActivetyPanel extends TabBarPanel
	{
		private var _skin:Activety_Skin;
		public function ActivetyPanel()
		{
			_skin=new Activety_Skin();
			super(_skin);
			_skin.tabBar.btnWidth=80;
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,ZongHeView,EmFunctionID.EM_HUODONGDATING);
			addTabDatas(TabBarSkin_pack,BossView,EmFunctionID.EM_BOSS_ACT);
			addTabDatas(TabBarSkin_pack,JiXianTiaoZhanPenelExt,EmFunctionID.EM_JIXIAN);
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			var funcKey:int=openTable;
			if(data&&funcKey!=0){
				var info:ActivetyInfo=data as ActivetyInfo;
				if(info){
					var panelCfg:Q_panel=PanelCfgData.getPanelCfg(info.actCfg.q_trans);
					var funcCfg:Q_newfunc=NewFuncCfgData.getFuncCfgByPanelId(panelCfg.id);
					funcKey=funcCfg.q_id;
				}
			}
			super.show(data,funcKey,parentContiner);
		}
		
		public function showPaiHang():void
		{
			var retw:int=JiXianTiaozhanPaiHnagPenelExt.showPanel(this);
			if (retw!=0) 
			{
				onStageResize(_stage.stageWidth-retw,_stage.stageHeight);
			}
		}
		
		override public function hide():void
		{
			super.hide();
			JiXianTiaozhanPaiHnagPenelExt.remove(this);
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			var gap:int = 20;
			var w:int = this.width;
			this.x =(sw - w)/2;
			this.y =(sh - this.height)/2;
		}
	}
}