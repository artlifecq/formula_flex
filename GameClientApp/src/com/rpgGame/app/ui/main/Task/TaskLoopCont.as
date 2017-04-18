package com.rpgGame.app.ui.main.Task
{
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	public class TaskLoopCont
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var scrollBar :ScrollContainer;
		private var scrollBox:Group;
		private var navi1:Label;
		private var navi2:Label;
		private var navi3:Label;
		private var kill1Item:SkinnableContainer;
		private var kill1Label:Label;
		private var kill2Item:SkinnableContainer;
		private var kill2Label:Label;
		private var kill3Item:SkinnableContainer;
		private var kill3Label:Label;
		private var extraLabel:Label;
		private var ico1BgList:Vector.<UIAsset>;
		private var ico1List:Vector.<BgIcon>;
		private var ico2BgList:Vector.<UIAsset>;
		private var ico2List:Vector.<BgIcon>;
		private var subBut1:Button;
		private var subBut2:Button;
		public function TaskLoopCont(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			init();
		}
		private function init():void
		{
			scrollInit();
			navi1=_skin.sec_navi1;
			navi2=_skin.sec_navi2;
			navi3=_skin.sec_navi3;
			kill1Item=_skin.sec_killbut1;
			kill2Item=_skin.sec_killbut2;
			kill3Item=_skin.sec_killbut3;
			kill1Label=Renwu_Item(kill1Item.skin).labelDisplay;
			kill2Label=Renwu_Item(kill2Item.skin).labelDisplay;
			kill3Label=Renwu_Item(kill3Item.skin).labelDisplay;
			extraLabel=_skin.sec_info;
			subBut1=_skin.sec_subbut1;
			subBut2=_skin.sec_subbut2;
			var i:int;
			var ico:BgIcon
			ico1BgList=new Vector.<UIAsset>();
			ico1BgList.push(_skin.sec_ico1_0);
			ico1BgList.push(_skin.sec_ico1_1);
			ico1BgList.push(_skin.sec_ico1_2);
			ico1BgList.push(_skin.sec_ico1_3);
			ico1BgList.push(_skin.sec_ico1_4);
			ico1BgList.push(_skin.sec_ico1_5);
			ico1List=new Vector.<BgIcon>();
			for(i=0;i<ico1BgList.length;i++)
			{
				ico=new BgIcon(IcoSizeEnum.ICON_48);
				ico.x=ico1BgList[i].x-6;
				ico.y=ico1BgList[i].y-6;
				ico.visible=false;
				ico1BgList[i].visible=false;
				ico1List.push(ico);
				scrollBox.addChild(ico);
			}
			ico2BgList=new Vector.<UIAsset>();
			ico2BgList.push(_skin.sec_ico2_0);
			ico2BgList.push(_skin.sec_ico2_1);
			ico2BgList.push(_skin.sec_ico2_2);
			ico2BgList.push(_skin.sec_ico2_3);
			ico2BgList.push(_skin.sec_ico2_4);
			ico2BgList.push(_skin.sec_ico2_5);
			ico2List=new Vector.<BgIcon>();
			for(i=0;i<ico2BgList.length;i++)
			{
				ico=new BgIcon(IcoSizeEnum.ICON_48);
				ico.x=ico2BgList[i].x-6;
				ico.y=ico2BgList[i].y-6;
				ico.visible=false;
				ico2BgList[i].visible=false;
				ico2List.push(ico);
				scrollBox.addChild(ico);
			}
			
			
			navi1.htmlText="[主线]第一章 <u>新手村</u><font color='#8b8d7b'>(未完成)</font>";
			navi2.htmlText="[支线]强化装备<font color='#8b8d7b'>(未完成)</font>";
			navi3.htmlText="[环式]<u>采矿</u><font color='#ffffff'>(10/20)</font><font color='#8b8d7b'>(未完成)</font>";
			
			kill1Label.htmlText="交谈：<u>项少龙交谈</u><font color='#cfc6ae'>(0/30)</font>";
			kill2Label.htmlText="击杀：<u>击杀强盗</u><font color='#cfc6ae'>(0/10)</font>";
			kill3Label.htmlText="采集：<u>采集铁矿</u><font color='#cfc6ae'>(0/20)</font>";
			extraLabel.htmlText="完成<font color='#ff0000'>38</font>环可获得额外奖励：";
			
			
		/*	ico1List[0].setIconResName(ClientConfig.getItemIcon("201",IcoSizeEnum.ICON_48));
			ico1List[0].visible=true;
			ico1BgList[0].visible=true;
			ico2List[0].setIconResName(ClientConfig.getItemIcon("203",IcoSizeEnum.ICON_48));
			ico2List[0].visible=true;
			ico2BgList[0].visible=true;*/
			
			//_skin.sec_killbut1
			viewSet();
		}
		
		private function scrollInit():void
		{
			
			scrollBar=_skin.scroll_bar;
			scrollBox=_skin.scroll_box;
			scrollBar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scrollBar.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			scrollBar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			scrollBox.y=0;
			scrollBar.addChild(scrollBox);
		}
		
		public function show(key:Boolean):void
		{
			_skin.secondary_box.visible=key;
		}
		
		private var viewCfg:Array=[1,2,1,3];//显示的配置 0:是否有支线，1:支线物品数，2:是否有环线，3:环线物品数
		private var loopY:Array=[[45,62,85,210,105],[238,255,278,403,298]];
		/**根据不同情况设置界面显示*/
		public function viewSet():void
		{
			//没有的移除显示对象
			scrollBox.removeChild(navi2);
			scrollBox.removeChild(kill2Item);
			scrollBox.removeChild(subBut1);
			var i:int,length:int,vsleng:int;
			for(i=0;i<ico1BgList.length;i++)
			{
				scrollBox.removeChild(ico1BgList[i]);
				scrollBox.removeChild(ico1List[i]);
			}
			
			if(viewCfg[0]==1)//没有支线 清除支线显示        重置支线位置
			{
				scrollBox.addChild(navi2);
				scrollBox.addChild(kill2Item);
				scrollBox.addChild(subBut1);
				length=viewCfg[1]<ico1BgList.length?viewCfg[1]:ico1BgList.length;
				for(i=0;i<length;i++)
				{
					scrollBox.addChild(ico1BgList[i]);
					scrollBox.addChild(ico1List[i]);
					ico1BgList[i].visible=true;
					ico1List[i].visible=true;
				}
				vsleng=length>0?int(length/3.5+1):0;
				//vsleng=2-vsleng;
				//subBut1.y=92+53*vsleng;
				subBut1.y=198-53*(2-vsleng);
				
			}
			
			scrollBox.removeChild(navi3);
			scrollBox.removeChild(kill3Item);
			scrollBox.removeChild(extraLabel);
			scrollBox.removeChild(subBut2);
			for(i=0;i<ico2BgList.length;i++)
			{
				scrollBox.removeChild(ico2BgList[i]);
				scrollBox.removeChild(ico2List[i]);
			}
			if(viewCfg[2]==1)//没有支线 清除支线显示        重置支线位置
			{
				scrollBox.addChild(navi3);
				scrollBox.addChild(kill3Item);
				scrollBox.addChild(extraLabel);
				scrollBox.addChild(subBut2);
				length=viewCfg[3]<ico2BgList.length?viewCfg[3]:ico2BgList.length;
				for(i=0;i<length;i++)
				{
					scrollBox.addChild(ico2BgList[i]);
					scrollBox.addChild(ico2List[i]);
					ico2BgList[i].visible=true;
					ico2List[i].visible=true;
				}
				var ly:Array=viewCfg[0]==0?ly=loopY[0]:ly=loopY[1];
				var chay:int,addy:int;
				
				if(viewCfg[0]==0)
				{
					ly=loopY[0];
				}
				else
				{
					ly=loopY[1];
					chay=53*(2-vsleng);
				}
				
				navi3.y=ly[0]-chay;
				kill3Item.y=ly[1]-chay;
				extraLabel.y=ly[2]-chay;
				subBut2.y=ly[3]-chay;
				for(i=0;i<ico2BgList.length;i++)
				{
					addy=int(i/3)*53;
					ico2BgList[i].y=ly[4]-chay+addy;
					ico2List[i].y=ly[4]-chay+addy;
					
					
				}
				length=viewCfg[3];
				vsleng=length>0?int(length/3.5+1):0;
				subBut2.y-=53*(2-vsleng);
				
			}
			
			
		}
		
		public function loopTaskView():void
		{
			
		}
	}
}