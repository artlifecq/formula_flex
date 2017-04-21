package com.rpgGame.appModule.common.itemRender
{
	import com.netease.protobuf.stringToByteArray;
	import com.rpgGame.app.manager.HeChengManager;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	import com.rpgGame.coreData.enum.HeChengEnum;
	
	import feathers.controls.Button;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	import feathers.controls.renderers.DefaultGroupedTreeItemRender;
	
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_an;
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_qian;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
	import org.mokylin.skin.common.over.SelectBtn;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class HeChengItemRender extends BaseDefaultListItemRenderer
	{
		public function HeChengItemRender()
		{
			super();
		}
		
		private var btn:Button;
		private var radioBtn:ToggleButton;
		
		private var sonList:Sprite;
		
		private var sonBySonList:Sprite;
		
		private var isUpDownKey:Boolean=false;
		override protected function initialize():void
		{
			super.initialize();
			
		}
		
		override protected function commitData():void
		{
			var type:int=_data as int;
			btn=new Button();				
			switch(type)
			{
				case HeChengEnum.MAIN_TYPE_JIANDING:
					btn.name = "btnjianding_"+type;
					btn.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
					break;
				case HeChengEnum.MAIN_TYPE_BIANSHI:
					btn.name = "btnbianshi_"+type;
					btn.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
					break;
			}
			btn.addEventListener(Event.TRIGGERED,mainBtnHandler);
			this.addChild(btn);
		}
		
		private function initSonList(type:int,list:Vector.<int>):void
		{
			if(list==null) return;
			if(sonList!=null&&sonList.numChildren>0) sonList.removeChildAt(0);
			else
				sonList=new Sprite();
			for(var i:int=0;i<list.length;i++)
			{
				radioBtn=new ToggleButton();
				radioBtn.styleClass=org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
				radioBtn.name="HeChengSonBtn_"+type+"_"+list[i];
				radioBtn.label = "";//初级鉴定图纸	
				radioBtn.y=btn.height+i*radioBtn.height;
				radioBtn.addEventListener(Event.TRIGGERED,radioBtnHandler);
				sonList.addChild(radioBtn);
			}
		}
		
		//设置次子项按钮
		private function setSonBySonList(type:int,sontype:int,list:Vector.<int>):void
		{
			if(sonBySonList!=null&&sonBySonList.numChildren>0) sonBySonList.removeChildAt(0);
			else sonBySonList=new Sprite();
			var temp:Button;
			for(var i:int=0;i<list.length;i++)
			{
				temp=new Button();
				if(i%2==0)
				{
					temp.styleClass=org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_an;
				}
				else
				{
					temp.styleClass=org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_qian;
				}
				temp.name="HeChengSonLab_"+type+"_"+sontype+"_"+list[i];
				temp.y=50+i*temp.height;
				temp.addEventListener(Event.TRIGGERED,sonSpriteHandler);
				sonBySonList.addChild(temp);
			}
		}
		
		private function mainBtnHandler(e:Event):void
		{
			var str:Array=(e.currentTarget as Button).name.split('_');
			if(str==null||str.length<=0) return;	
			if(str.length==2)
			{
				var type:int=parseInt(str[1]);
				isUpDownKey=!isUpDownKey;
				if(isUpDownKey)
				{
					initSonList(type,HeChengData.getSonTypeListByType(type));
					this.addChild(sonList);
				}
				else
				{
					this.removeChild(sonList);
				}
			}
		}
		
		private function radioBtnHandler(e:Event):void
		{
			var str:Array=(e.currentTarget as Button).name.split('_');
			if(str==null||str.length<=0) return;	
			if(str.length==3&&str[0]=="HeChengSonBtn")
			{
				var type:int=parseInt(str[1]);
				var sontype:int=parseInt(str[2]);
				var radbtn:ToggleButton=e.currentTarget as ToggleButton;
				radbtn.isToggle=!radbtn.isToggle;	
				if(!radbtn.isToggle)
				{
					setSonBySonList(type,sontype,HeChengData.getSonTypeListByType(type));
					(sonList.getChildByName(radbtn.name) as Sprite).addChild(sonBySonList);
				}
				else
				{
					if((sonList.getChildByName(radbtn.name) as Sprite).getChildIndex(sonBySonList)!=-1)
						(sonList.getChildByName(radbtn.name) as Sprite).removeChild(sonBySonList);
				}
			}
		}
		
		private function sonSpriteHandler(e:Event):void
		{
			var str:Array=(e.currentTarget as Button).name.split('_');
			if(str==null||str.length<=0) return;	
			if(str.length==4&&str[0]=="HeChengSonLab")
			{
				var type:int=parseInt(str[1]);
				var sontype:int=parseInt(str[2]);
				var subsontype:int=parseInt(str[3]);
				var q_hecheng:Q_hecheng=HeChengData.getSonbySonTypeListByType(type,sontype,subsontype);
				if(q_hecheng!=null) HeChengManager.setHeChengItem(q_hecheng);
			}
		}
	}
}