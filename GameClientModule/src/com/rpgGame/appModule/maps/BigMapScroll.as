package com.rpgGame.appModule.maps
{
	import com.rpgGame.coreData.type.SceneCharType;
	
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.maps.NpcItem;
	import org.mokylin.skin.app.maps.NpcItem2;
	import org.mokylin.skin.app.maps.mapItems;
	
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.display.Sprite;
	import com.rpgGame.app.manager.map.BigMapsManager;
	import com.rpgGame.app.manager.map.BigMapIocnDataMode;

	/**
	 * 处理大地图上的 右边滚动框里面的相关显示和控制
	 * @author YT
	 * 
	 */	
	public class BigMapScroll
	{
		
		private var scroll_Bar :ScrollContainer;
		private var scrollBox:Sprite;
		
		/**npc栏位*/
		private var npcItemSpr:Sprite;
		/**npc列表*/
		private var npcList:Sprite;
		private var npcSkin:mapItems;
		
		
		/**怪物栏位*/
		private var monsterItemSpr:Sprite;
		/**怪物列表*/
		private var monsterList:Sprite;
		private var monsterSkin:mapItems;
		/**传送栏位*/
		private var thansItemSpr:Sprite;
		/**送列表*/
		private var thansList:Sprite;
		private var thansSkin:mapItems;
		
		
		public function BigMapScroll(sk:ScrollContainer)
		{
			scroll_Bar=sk;
		}
		public function init():void
		{
			scrollInit();
			npcItemInit();
			monsterItemInit();
			thansItemInit();
		}
		public function boxView():void
		{
			clearItem();
			setItem();
			scrollChange();
		}
		
		
		public function onTouchTarget(target:DisplayObject):void 
		{
			
			switch (target) {
				case npcSkin.btn_jia:
					npcItemUpDownMTouch();
					break;
				case npcSkin.btn_jian:
					npcItemUpDownMTouch();
					break;
				case monsterSkin.btn_jia:
					monsterItemUpDownMTouch()
					break;
				case monsterSkin.btn_jian:
					monsterItemUpDownMTouch()
					break;
				case thansSkin.btn_jia:
					thansItemUpDownMTouch()
					break;
				case thansSkin.btn_jian:
					thansItemUpDownMTouch()
					break;
			}
			
			
			
		}
		
		private var npcUpDownKey:Boolean=true;
		/**npc栏位伸缩*/
		private function npcItemUpDownMTouch():void
		{
			npcUpDownKey=!npcUpDownKey;
			npcSkin.btn_jia.visible=!npcUpDownKey;
			npcSkin.btn_jian.visible=npcUpDownKey;
			
			if(npcUpDownKey)
			{
				npcItemSpr.addChild(npcList);
				monsterItemSpr.y=npcItemSpr.y+npcItemSpr.height;
				thansItemSpr.y=monsterItemSpr.y+monsterItemSpr.height;
				
			}
			else
			{
				npcItemSpr.removeChild(npcList);
				monsterItemSpr.y=npcItemSpr.y+npcItemSpr.height;
				thansItemSpr.y=monsterItemSpr.y+monsterItemSpr.height;
				
			}
			scrollChange();
		}
		
		private var monsterUpDownKey:Boolean=true;
		/**monster栏位伸缩*/
		private function monsterItemUpDownMTouch():void
		{
			monsterUpDownKey=!monsterUpDownKey;
			monsterSkin.btn_jia.visible=!monsterUpDownKey;
			monsterSkin.btn_jian.visible=monsterUpDownKey;
			
			if(monsterUpDownKey)
			{
				monsterItemSpr.addChild(monsterList);
				thansItemSpr.y=monsterItemSpr.y+monsterItemSpr.height;
				
			}
			else
			{
				monsterItemSpr.removeChild(monsterList);
				thansItemSpr.y=monsterItemSpr.y+monsterItemSpr.height;
				
			}
			scrollChange();
		}
		private var thansUpDownKey:Boolean=true;
		/**thans栏位伸缩*/
		private function thansItemUpDownMTouch():void
		{
			thansUpDownKey=!thansUpDownKey;
			thansSkin.btn_jia.visible=!thansUpDownKey;
			thansSkin.btn_jian.visible=thansUpDownKey;
			
			if(thansUpDownKey)
			{
				thansItemSpr.addChild(thansList);
			}
			else
			{
				thansItemSpr.removeChild(thansList);
				
			}
			scrollChange();
		}
		private function scrollChange():void
		{
			if(scrollBox.height<scroll_Bar.height+1)
			{
				scroll_Bar.scrollToPosition(0,0, 0.5);
			}
			scroll_Bar.addChild(scrollBox);
			
		}
		
		
		/**滚动框初始化*/
		private function scrollInit():void
		{
			scroll_Bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scroll_Bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			scroll_Bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			scroll_Bar.width = 266;
			scroll_Bar.height =452;
			scroll_Bar.x=664;
			scroll_Bar.y=73;
			
			scrollBox=new Sprite();
			scroll_Bar.addChild(scrollBox);
			var back : Shape = new Shape();
			back.graphics.beginFill(0x00FF00);
			back.graphics.drawRoundRect(0, 0, 247, 452.1);
			back.graphics.endFill();
			back.visible=false;
			scrollBox.addChild(back);
		}
		/**npc栏位初始化*/
		private function npcItemInit():void
		{
			npcItemSpr=new Sprite();
			scrollBox.addChild(npcItemSpr);
			npcList=new Sprite();
			npcList.x=3;
			npcList.y=30;
			npcItemSpr.addChild(npcList);
			var npcBar:SkinnableContainer=getItemBar();
			npcSkin=getItemSkin("npc");
			npcBar.skin=npcSkin;
			npcItemSpr.addChild(npcBar);
			
		}
		
		
		
		/**怪物栏位初始化*/
		private function monsterItemInit():void
		{
			monsterItemSpr=new Sprite();
			scrollBox.addChild(monsterItemSpr);
			monsterList=new Sprite();
			monsterList.x=3;
			monsterList.y=30;
			monsterItemSpr.addChild(monsterList);
			var monsterBar:SkinnableContainer=getItemBar();
			monsterSkin=getItemSkin("guaiwu");
			monsterBar.skin=monsterSkin;
			monsterItemSpr.addChild(monsterBar);
			
		}
		/**传送地点位初始化*/
		private function thansItemInit():void
		{
			thansItemSpr=new Sprite();
			scrollBox.addChild(thansItemSpr);
			thansList=new Sprite();
			thansList.x=3;
			thansList.y=30;
			thansItemSpr.addChild(thansList);
			//thansItenSpr.addChild(getItemBar("传送地点"));
			var thansBar:SkinnableContainer=getItemBar();
			thansSkin=getItemSkin("chuansongdidian");
			thansBar.skin=thansSkin;
			thansItemSpr.addChild(thansBar);
			
		}
		/**npc栏位设置*/
		public function setItem():void
		{
			npcList.addChild(getBackBar(BigMapsManager.getMapsIconListByType(SceneCharType.NPC)));
			npcList.addChild(getBackBar(BigMapsManager.getMapsIconListByType(SceneCharType.COLLECT)));
			monsterList.addChild(getBackBar(BigMapsManager.getMapsIconListByType(SceneCharType.MONSTER)));
			thansList.addChild(getBackBar(BigMapsManager.getMapsIconListByType(SceneCharType.TRANS)));
			npcItemSpr.y=2;
			monsterItemSpr.y=npcItemSpr.y+npcItemSpr.height;
			thansItemSpr.y=monsterItemSpr.y+monsterItemSpr.height;
		}
		public function clearItem():void
		{
			if(npcList.numChildren>0)npcList.removeChildAt(0);
			if(monsterList.numChildren>0)monsterList.removeChildAt(0);
			if(thansList.numChildren>0)thansList.removeChildAt(0);
			npcItemSpr.y=2;
			monsterItemSpr.y=npcItemSpr.y+npcItemSpr.height;
			thansItemSpr.y=monsterItemSpr.y+monsterItemSpr.height;
			
			
		}
		
		
		
		private function getItemBar():SkinnableContainer
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=1;
			temp.width = 247;
			temp.height = 28;
			return temp;
		}
		private function getItemSkin(name:String):mapItems
		{
			var skin:mapItems = new mapItems();
			skin.lbl_name.styleName="ui/app/maps/"+name+".png";
			return skin;
		}
		private function getBackBar(data:Vector.<BigMapIocnDataMode>):Sprite
		{
			var bar : Sprite = new Sprite();
			var i:int,lenth:int;
			var temp:SkinnableContainer;
			var skin:NpcItem;
			var skin2:NpcItem2;
			lenth=data.length
			for(i=0;i<lenth;i++)
			{
				temp = new SkinnableContainer();
				var name:String=data[i].name;
				
				if(i%2==0)
				{
					skin= new NpcItem();
					skin.lbl_name.htmlText=name;
					skin.lbl_level.htmlText=data[i].type==SceneCharType.MONSTER?data[i].level+"级":"";
					skin.btn_over.name="ROLE_"+data[i].id+"_1";
					skin.btnSend.name="ROLE_"+data[i].id+"_2";
					temp.skin = skin;
				}
				else
				{
					skin2 = new NpcItem2();
					skin2.lbl_name.htmlText=name;
					skin2.lbl_level.htmlText=data[i].type==SceneCharType.MONSTER?data[i].level+"级":"";
					skin2.btn_over.name="ROLE_"+data[i].id+"_1";
					skin2.btnSend.name="ROLE_"+data[i].id+"_2";
					temp.skin = skin2;
				}
				temp.y=i*temp.height;
				bar.addChild(temp);
			}
				
			
			return bar;
		}
		
	}
}