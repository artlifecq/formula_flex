package com.rpgGame.appModule.guild.war
{
	import com.game.mainCore.core.manager.TimerManager;
	import com.game.mainCore.libCore.timer.TimerData;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangChengJieSuan;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiHangList;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 王城争霸结果
	 *@author dik
	 *2017-7-3
	 **/
	public class WczbResultPanel extends SkinUIPanel
	{
		private var showTime:int=10;
		
		private var _skin:WangChengJieSuan;
		private var _rankDatas:ListCollection;

		private var rankList:WangChengPaiHangList;
		private var timer:TimerData;
		private var rewardGrp:RewardGroup;
		
		public function WczbResultPanel()
		{
			_skin=new WangChengJieSuan();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			rankList=_skin.skinList.skin as WangChengPaiHangList;
			rankList.List.itemRendererType=WczbResultItemRender;
			rankList.List.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_rankDatas=new ListCollection();
			rankList.List.dataProvider=_rankDatas;
			rewardGrp=new RewardGroup(IcoSizeEnum.ICON_48,_skin.gid3_1);
		}
		
		override public function hide():void
		{
			super.hide();
			TimerManager.deleteTimer(timer);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
		}
		
		private function getResultData():void
		{
			_skin.lbBang1.text="胜利帮派";
			_skin.lbBang2.text="失败帮派";
			_skin.skinBar.maximum=100;
			_skin.skinBar.value=50;
			_skin.lbBar.text=_skin.skinBar.value+"/"+_skin.skinBar.maximum;
			
			_skin.numPaiming.label="12"; 
			_skin.numJisha.label="12"; 
			_skin.numJifen.label="12"; 
			
			
			//参与奖励+进攻奖励+积分折算奖励
			var isWin:Boolean;
			var jifen:int;
			if(isWin){
				
			}else{
				
			}
			timer=TimerManager.createTimer(1000,showTime,updateTime);
		}
		
		private function updateTime():void
		{
			showTime--;
			_skin.lbTime.text=showTime+"秒后自动退出";
			if(showTime<=0){
				this.hide();
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnLingQu){
				this.hide();
			}
		}
	}
}