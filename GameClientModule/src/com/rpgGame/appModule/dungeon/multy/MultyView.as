package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.appModule.fightsoul.PropView;
	
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.app.fuben.FuBen_DuoRen_Item;
	import org.mokylin.skin.app.fuben.FuBen_DuoRen_Skin;
	import org.mokylin.skin.app.maps.mapItems;
	import org.mokylin.skin.component.list.ListSkin1;
	
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;

	public class MultyView
	{
		private var _skin:FuBen_DuoRen_Skin;
		private var scroll_Bar :ScrollContainer;
		private var scrollBox:Sprite;
		private var scrollBack : Shape;
		private var skinList:Vector.<SkinnableContainer>;
		private var itemList:Vector.<FuBen_DuoRen_Item>;
		
		private var selectId:int=0;
		public function MultyView(skin:SkinnableContainer)
		{
			_skin=skin.skin as FuBen_DuoRen_Skin;
			initScroll();
			creatDungeonItem();
			
			selectId=0;
			unSelectItem(itemList[selectId]);
			setSite();
			
			//_skin.btnEnter.addEventListener(FeathersEventType.STATE_CHANGE,buttonTouchHandler);
		}
		
		private function initScroll():void
		{
			scroll_Bar=_skin.scroll_Bar;
			scroll_Bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scroll_Bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			scroll_Bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			scrollBack = new Shape();
			scrollBack.graphics.beginFill(0x00FF00);
			scrollBack.graphics.drawRoundRect(0, 0, 10, scroll_Bar.height+0.1);
			scrollBack.graphics.endFill();
			scrollBack.visible=false;
			scrollBox=new Sprite();
			scrollBox.addChild(scrollBack);
			scroll_Bar.addChild(scrollBox);
			
		}
		
		public function creatDungeonItem():void
		{
			skinList=new Vector.<SkinnableContainer>();
			itemList=new Vector.<FuBen_DuoRen_Item>();
			var skin:SkinnableContainer;
			var item:FuBen_DuoRen_Item;
			var i:int;
			for(i=0;i<5;i++)
			{
				skin=getItemSkin(i);
				item=skin.skin as FuBen_DuoRen_Item
				skinList.push(skin);
				itemList.push(item);
				item.btnSelect.visible=true;
				item.grpIcon.visible=false;
				item.uiName1.styleName="ui/dungeon/changpingjiucheng/name_out.png";
				item.uiName2.styleName="ui/dungeon/changpingjiucheng/name_select.png";
				item.imgBg_out.styleName="ui/dungeon/changpingjiucheng/bg_out.jpg";
				item.imgBg_select.styleName="ui/dungeon/changpingjiucheng/bg_select.jpg";
				scrollBox.addChild(skin);
			}
			
			
		}
		public function unSelectItem(item:FuBen_DuoRen_Item):void
		{
			//var item:FuBen_DuoRen_Item=itemList[selectId];
			item.btnSelect.height=125;
			item.uiName1.visible=false;
			item.uiName2.visible=true;
			item.imgBg_out.visible=false;
			item.imgBg_select.visible=true;
			item.grpIcon.visible=true;
			//item.btnSelect.selectedHoverSkin.visible=true;
		}
		public function cloSelectItem(item:FuBen_DuoRen_Item):void
		{
			//var item:FuBen_DuoRen_Item=itemList[selectId];
			item.btnSelect.height=91;
			item.uiName1.visible=true;
			item.uiName2.visible=false;
			item.imgBg_out.visible=true;
			item.imgBg_select.visible=false;
			item.grpIcon.visible=false;
			//item.btnSelect.selectedHoverSkin.visible=true;
		}
		private function setSite():void
		{
			var i:int;
			for(i=0;i<skinList.length;i++)
			{
				skinList[i].y=i*95;
				if(i>selectId)
				{
					skinList[i].y+=34;
				}
			}
			scrollBack.height=skinList.length*95+34;
			scrollBox.addChild(scrollBack);
		}
		
		private function getItemSkin(id:int):SkinnableContainer
		{
			var skin:FuBen_DuoRen_Item =new FuBen_DuoRen_Item();
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.skin=skin;
			skin.btnSelect.name="select_"+id;
			skin.btnSelect.addEventListener(FeathersEventType.STATE_CHANGE,buttonTouchHandler);
			
			return temp;
		}
		
		private function buttonTouchHandler(event:Event):void
		{
			var id:int=-1;
			var name:Array
			var state:String;
			var but:Button=Button(event.target);
			
			if(but!=null)
			{
				state=Button(event.target).currentState;
			}
			if(state=="down")
			{
				name=but.name.split("_");
				id=int(name[1]);
				changeItem(id);
				
				
				
			}
		}
		
		private function changeItem(id:int):void
		{
			if(id<0||id>=itemList.length)
				return;
			if(selectId==id)
				return;
			cloSelectItem(itemList[selectId]);
			unSelectItem(itemList[id]);
			selectId=id;
			setSite();
			/*var skin:SkinnableContainer;
			var item:FuBen_DuoRen_Item;
			skin=skinList[selectId];
			item=item[selectId];
			if(skin!=null&&item!=null)
			{
				item.btnSelect.height=91;
				
			}*/
			
			
		}
		
		
		
	}
}