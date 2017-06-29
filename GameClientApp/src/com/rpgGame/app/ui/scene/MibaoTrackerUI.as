package com.rpgGame.app.ui.scene
{
	import com.rpgGame.app.ui.scene.dungeon.DungeonTrackerUI;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.zonghe.qinlinmibao.Act_MiBao_ZhuiZong;
	import org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;
	
	/**
	 * 秦陵秘宝追踪
	 * @author YT
	 * 
	 */	
	public class MibaoTrackerUI extends SceneTrackerUI
	{
		private var _skin:Act_MiBao_ZhuiZong;
		private var skinList:Array;
		private var killButList:Vector.<Label>;
		private var killOkList:Vector.<UIAsset>;
		private var ico1List:Vector.<IconCDFace>;
		private var icoBg1List:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;
		private var icoBg2List:Vector.<UIAsset>;
		private var hitList:Vector.<PaiMing_Item>;
		public function MibaoTrackerUI()
		{
			_skin=new Act_MiBao_ZhuiZong();
			super(_skin);
			initUI();
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "btn_qiang_close":
					break;
			}
		}
		override protected function onShow() : void
		{
			super.onShow();
			addEvent();
			setUiRefresh();
			
			setUisite();
		}
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
			var icon:IconCDFace;
			while(ico1List.length>0){
				icon=ico1List.pop();
				icon.destroy();
			}
			while(ico2List.length>0){
				icon=ico2List.pop();
				icon.destroy();
			}
			icon=null;
		}
		private function addEvent():void
		{
			
			
		}
		private function removeEvent():void
		{
			
			
		}
		/**设置步骤面板显示*/
		private function setStep(step:int):void
		{
			if(step==1)
			{
				_skin.sec_navi0.visible=true;
				_skin.sec_navi2.visible=false;
				_skin.shanghai_List.visible=false;
				
			}
			
			
		}
		
		private function initUI():void
		{
			skinList=new Array();
			skinList.push(_skin.lbHeadName);
			skinList.push(_skin.sec_navi0);
			skinList.push(_skin.lbItem0);
			skinList.push(_skin.lbItem1);
			skinList.push(_skin.lbItem2);
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.lbJifen);
			skinList.push(_skin.lbZhenqi);
			skinList.push(_skin.ico1_0);
			skinList.push(_skin.ico1_4);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.shanghai_List);
			skinList.push(_skin.ico2_0);
			skinList.push(_skin.ico2_4);
			skinList.push(_skin.sec_info);
			skinList.push(_skin.sec_subbut1);
			var i:int;
			killButList=new Vector.<Label>();
			killOkList=new Vector.<UIAsset>();
			for(i=0;i<3;i++)
			{
				killButList.push(_skin["lbItem"+i]);
				killOkList.push(_skin["jisha"+i]);
			}
			var ico:IconCDFace;
			icoBg1List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg1List.push(_skin["ico1_"+i]);
			}
			ico1List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg1List.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg1List[i].x-6;
				ico.y=icoBg1List[i].y-6;
				ico.visible=false;
				ico1List.push(ico);
				_skin.task_box.addChild(ico);
			}
			icoBg2List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg2List.push(_skin["ico2_"+i]);
			}
			ico2List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg2List.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg2List[i].x-6;
				ico.y=icoBg2List[i].y-6;
				ico.visible=false;
				ico2List.push(ico);
				_skin.task_box.addChild(ico);
			}
			hitList=new Vector.<PaiMing_Item>();
			for(i=0;i<4;i++)
			{
				hitList.push(_skin["pmItem"+i].skin as PaiMing_Item);
			}
			
		}
		
		/**UI刷新*/
		private function setUiRefresh():void
		{
			var i:int;
			_skin.sec_navi0.visible=false;
			_skin.jf_num.text="";
			_skin.zq_num.text="";
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
				killOkList[i].visible=false;
			}
			for(i=0;i<icoBg1List.length;i++)
			{
				icoBg1List[i].visible=false;
				ico1List[i].visible=false;
				icoBg2List[i].visible=false;
				ico2List[i].visible=false;
			}
			_skin.sec_navi2.visible=false;
			_skin.shanghai_List.visible=false;
			for(i=0;i<hitList.length;i++)
			{
				hitList[i].lbNo.text=(i+1).toString();
				hitList[i].lbName.text="";
				hitList[i].lbNum.text="0";
			}
			_skin.sec_info.text="00:00:00";
			
		}
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=0;
			for(i=1;i<skinList.length;i++)
			{
				if(skinList[i].visible)
				{
					skinList[i].y=skinList[count].y+skinList[count].height+3;
					count=i;
				}
			}
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
			
			_skin.jf_num.y=_skin.lbJifen.y;
			_skin.zq_num.y=_skin.lbZhenqi.y;
			for(i=0;i<killButList.length;i++)
			{
				killOkList[i].y=killButList[i].y-26;
			}
			var id:int;
			for(i=0;i<icoBg1List.length;i++)
			{
				id=int(i/4)*4;
				if(icoBg1List[i].visible)
				{
					icoBg1List[i].y=icoBg1List[id].y;
					ico1List[i].y=icoBg1List[id].y-6;
				}
				if(icoBg2List[i].visible)
				{
					icoBg2List[i].y=icoBg2List[id].y;
					ico2List[i].y=icoBg2List[id].y-6;
				}
			}
		}
		
		
	}
	
}