package com.rpgGame.appModule.task
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.Huanshi_Renwu;
	
	import starling.display.DisplayObjectContainer;

	public class TaskLoopPanel  extends SkinUIPanel
	{
		protected var _skin :Huanshi_Renwu;
		private var titleLabel:Label;
		private var planLabel:Label;
		private var nav1Label:Label;
		private var nav2Label:Label;
		private var money1Label:Label;
		private var money2Label:Label;
		private var timerLabel:Label;
		private var ico1BgList:Vector.<UIAsset>;
		private var ico1List:Vector.<BgIcon>;
		private var ico2BgList:Vector.<UIAsset>;
		private var ico2List:Vector.<BgIcon>;
		
		public function TaskLoopPanel()
		{
			_skin=new Huanshi_Renwu();
			super(_skin);
			init()
		}
		
		private function init():void
		{
			titleLabel=_skin.lbl_title;
			planLabel=_skin.lb_wancheng;
			nav1Label=_skin.lab_navi1;
			nav2Label=_skin.lab_navi2;
			money1Label=_skin.lb_yuanbao;
			money2Label=_skin.lb_yinliang;
			timerLabel=_skin.lb_time;
			
			var i:int;
			var ico:BgIcon
			ico1BgList=new Vector.<UIAsset>();
			ico1BgList.push(_skin.ioc_1_0);
			ico1BgList.push(_skin.ioc_1_1);
			ico1BgList.push(_skin.ioc_1_2);
			ico1BgList.push(_skin.ioc_1_3);
			ico1List=new Vector.<BgIcon>();
			for(i=0;i<ico1BgList.length;i++)
			{
				ico=new BgIcon(IcoSizeEnum.ICON_42);
				ico.x=ico1BgList[i].x+6;
				ico.y=ico1BgList[i].y+6;
				ico.visible=false;
				ico1BgList[i].visible=false;
				ico1List.push(ico);
				this.addChild(ico);
			}
			ico2BgList=new Vector.<UIAsset>();
			ico2BgList.push(_skin.ioc_2_0);
			ico2BgList.push(_skin.ioc_2_1);
			ico2BgList.push(_skin.ioc_2_2);
			ico2BgList.push(_skin.ioc_2_3);
			ico2List=new Vector.<BgIcon>();
			for(i=0;i<ico2BgList.length;i++)
			{
				ico=new BgIcon(IcoSizeEnum.ICON_42);
				ico.x=ico2BgList[i].x+6;
				ico.y=ico2BgList[i].y+6;
				ico.visible=false;
				ico2BgList[i].visible=false;
				ico2List.push(ico);
				this.addChild(ico);
			}
			
			
			titleLabel.htmlText="环式任务";
			planLabel.htmlText="已完成环数：第2/20环";
			nav1Label.htmlText="本环任务奖励：";
			nav2Label.htmlText="今日完成<font color='#5DBD37'>5</font>环后，额外奖励";
			timerLabel.htmlText="10秒后自动领取奖励";
			money1Label.text="500";
			money2Label.text="200";
			
			ico1List[0].setIconResName(ClientConfig.getItemIcon("201",IcoSizeEnum.ICON_42));
			ico1List[0].visible=true;
			ico1BgList[0].visible=true;
			ico2List[0].setIconResName(ClientConfig.getItemIcon("203",IcoSizeEnum.ICON_42));
			ico2List[0].visible=true;
			ico2BgList[0].visible=true;
			
		}
		
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			
			
			
		}
		override public function hide():void 
		{
			super.hide();
			
		}
	}
}