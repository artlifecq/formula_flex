package com.rpgGame.app.ui.main.Task
{
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.RenWu_jindu;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	/**
	 * 主线支线环式面板
	 * @author YT
	 * 
	 */	
	public class TaskLeadCont
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var titleLable:Label;
		private var navi1Lable:Label;
		private var navi2Lable:Label;
		private var navi3Lable:Label;
		private var killLabel:Label;
		private var priLabel:Label
		private var jindu:RenWu_jindu;
		private var icoBgList:Vector.<UIAsset>;
		private var icoList:Vector.<BgIcon>;
		public function TaskLeadCont(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			
			init();
		}
		private function init():void
		{
			titleLable=_skin.pri_title;
			navi1Lable=_skin.pri_navi1;
			navi2Lable=_skin.pri_navi2;
			navi3Lable=_skin.pri_navi3;
			jindu=_skin.pri_probar.skin as RenWu_jindu;
			killLabel=Renwu_Item(_skin.pri_killbut.skin).labelDisplay;
			priLabel=_skin.pri_txt;
			icoBgList=new Vector.<UIAsset>();
			icoBgList.push(_skin.pri_ico0);
			icoBgList.push(_skin.pri_ico1);
			icoBgList.push(_skin.pri_ico2);
			icoBgList.push(_skin.pri_ico3);
			icoBgList.push(_skin.pri_ico4);
			icoBgList.push(_skin.pri_ico5);
			icoList=new Vector.<BgIcon>();
			var i:int;
			for(i=0;i<icoBgList.length;i++)
			{
				var ico:BgIcon=new BgIcon(IcoSizeEnum.ICON_48);
				ico.x=icoBgList[i].x-6;
				ico.y=icoBgList[i].y-6;
				ico.visible=false;
				icoBgList[i].visible=false;
				icoList.push(ico);
				_skin.primary_box.addChild(ico);
			}
			
			
			titleLable.htmlText="第一章:新手村";
			navi1Lable.htmlText="章节任务";
			navi2Lable.htmlText="任务描述";
			navi3Lable.htmlText="任务进度";
			jindu.labelDisplay.text="40%";
			jindu.pro_jindu.maximum=100;
			jindu.pro_jindu.value=40;
			priLabel.htmlText="听闻有刺客密谋造反，请速速追捕嫌犯";
			killLabel.htmlText="击杀：<u>少林杖僧</u><font color='#cfc6ae'>(2/10)</font>";
			
			
			
			icoList[0].setIconResName(ClientConfig.getItemIcon("201",IcoSizeEnum.ICON_48));
			icoList[0].visible=true;
			icoBgList[0].visible=true;
			icoList[1].setIconResName(ClientConfig.getItemIcon("203",IcoSizeEnum.ICON_48));
			icoList[1].visible=true;
			icoBgList[1].visible=true;
			
			
		}
		
		public function show(key:Boolean):void
		{
			_skin.primary_box.visible=key;
		}
		
	}
}