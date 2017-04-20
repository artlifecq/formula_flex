package com.rpgGame.appModule.common.itemRender
{
	import com.netease.protobuf.stringToByteArray;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.enum.HeChengEnum;
	
	import feathers.controls.Button;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	import feathers.controls.renderers.DefaultGroupedTreeItemRender;
	
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_an;
	import org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_qian;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
	import org.mokylin.skin.common.over.SelectBtn;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class HeChengItemRender extends DefaultGroupedTreeItemRender
	{
		public function HeChengItemRender()
		{
			super();
		}
		
		private var btn:Button;
		private var radioBtn:Radio;
		
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
				case HeChengEnum.MAIN_TYPE_TUZHI:
					btn.name = "btntuzhi_"+type;
					btn.styleClass = org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonJianding;
					break;
			}
			this.addChild(btn);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			var str:Array=target.name.split('_');
			if(str==null||str.length<=0) return;	
			if(str.length==3&&str[0]=="HeChengSonBtn")
			{
				var index:int=parseInt(str[1]);
				var type:int=parseInt(str[2]);
				var radbtn:Radio=target as Radio;
				if(radbtn.isSelected)
				{
					setSonBySonList(HeChengData.getSonTypeListByType(type));
					(sonList.getChildByName(target.name) as Sprite).addChild(sonBySonList);
				}
				else
				{
					(sonList.getChildByName(target.name) as Sprite).removeChild(sonBySonList);
				}
			}
			if(str.length==2&&str[0]=="btntuzhi")
			{
				type=parseInt(str[1]);
				isUpDownKey=!isUpDownKey;
				if(isUpDownKey)
				{
					initSonList(HeChengData.getSonTypeListByType(type));
					this.addChild(sonList);
				}
				else
				{
					this.removeChild(sonList);
				}
			}
		}
		
		private function initSonList(list:Vector.<int>):void
		{
			if(list==null) return;
			
			for(var i:int=0;i<list.length;i++)
			{
				sonList=new Sprite();
				radioBtn=new Radio();
				radioBtn.styleClass=org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonErji_bg;
				radioBtn.name="HeChengSonBtn_"+i+"_"+list[i];
				radioBtn.label = "初级鉴定图纸";				
				sonList.addChild(radioBtn);
			}
		}
		
		//设置次子项按钮
		private function setSonBySonList(list:Vector.<int>):void
		{
			if(sonBySonList.numChildren>0) sonBySonList.removeChildAt(0);
			var temp:SkinnableContainer;
			for(var i:int=0;i<list.length;i++)
			{
				temp=new SkinnableContainer();
				if(i%2==0)
				{
					temp.height = 32;
					var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_an;
					temp.skin = skin
					temp.width = 245;
				}
				else
				{
					temp.height = 32;
					skin = new org.mokylin.skin.app.zhuangbei.hecheng.Cont_Item_qian;
					temp.skin = skin
					temp.width = 245;
				}
				temp.name="HeChengSonLab_"+i+"_"+list[i];
				temp.y=i*temp.height;
				sonBySonList.addChild(temp);
			}
		}
	}
}