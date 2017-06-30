package com.rpgGame.appModule.bag
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import away3d.events.Event;
	
	import feathers.controls.Slider;
	
	import org.mokylin.skin.app.beibao.wupingchaifen;
	import org.mokylin.skin.common.ChaiFen_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *物品拆分面板 
	 * @author dik
	 * 
	 */
	public class ItemSplitPanel extends SkinUIPanel
	{
		private var skin:wupingchaifen;
		private var _iteminfo:ClientItemInfo;
		
		private var targetIcon:DragDropItem;
		private var split1:DragDropItem;
		private var split2:DragDropItem;

		private var allNum:int;
		private var slider:Slider;
		
		public function ItemSplitPanel()
		{
			skin=new wupingchaifen();
			super(skin);
			
			split1=getGrid();
			split2=getGrid();
			targetIcon=getGrid();
			this.addChild(split1);
			this.addChild(split2);
			this.addChild(targetIcon);
			
			skin.input_txt.restrict="0-9";
			
//			split1.touchable=split2.touchable=targetIcon.touchable=false;
			
			targetIcon.x=70;
			split1.x=173;
			split2.x=229;
			targetIcon.y=split1.y=split2.y=52;
			slider=(skin.skinChaiFen.skin as ChaiFen_Skin).slider;
			slider.value=1;
			slider.y+=10;
		}
		
		override public function hide():void
		{
			super.hide();
			skin.input_txt.removeEventListener(Event.CHANGE,onChangeNum);
			slider.removeEventListener(Event.CHANGE,onChange);
		}
		
		private function onChangeNum(e:Event):void
		{
			var num:int=int(skin.input_txt.text);
			num=num<=0?1:num;
			num=num>=_iteminfo.itemInfo.num?_iteminfo.itemInfo.num:num;
			
			slider.value=num;
			skin.input_txt.text=slider.value.toString();
			split1.count=allNum-slider.value;
			split2.count=slider.value;
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
		
		private function onChange(event:Event):void
		{
			skin.input_txt.text=slider.value.toString();
			split1.count=allNum-slider.value;
			split2.count=slider.value;
		}
		
		private function getGrid():DragDropItem
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_42,GridBGType.GRID_SIZE_44);
			var grid:DragDropItem = render.getGrid();
			grid.selectImgVisible=false;
			grid.gridInfo=new GridInfo(0,0);
			return grid;
		}
		
		public function set iteminfo(value:ClientItemInfo):void
		{
			_iteminfo = value;
			
			FaceUtil.SetItemGrid(targetIcon, _iteminfo);
			FaceUtil.SetItemGrid(split1, _iteminfo);
			FaceUtil.SetItemGrid(split2, _iteminfo);
			
			allNum=_iteminfo.itemInfo.num;
			
			targetIcon.count=allNum;
			targetIcon.alwayShowCount=split1.alwayShowCount=split2.alwayShowCount=true;
			
			slider.minimum=1;
			slider.maximum=_iteminfo.itemInfo.num-1;
			slider.step=1;
			
			slider.value=Math.floor(allNum/2);//默认对半拆分
			split1.count=allNum-slider.value;
			split2.count=slider.value;
			skin.input_txt.text=slider.value.toString();
		}

		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case skin.btn_ok:
					ItemSender.reqSplitItem(_iteminfo,splitNum);
					hide();
					break;
				case skin.btn_cancel:
					hide();
					break;
				case (skin.skinChaiFen.skin as ChaiFen_Skin).btn_min:
					slider.value=slider.value-1;
					skin.input_txt.text=slider.value.toString();
					split1.count=allNum-slider.value;
					split2.count=slider.value;
					break;
				case (skin.skinChaiFen.skin as ChaiFen_Skin).btn_max:
					slider.value=slider.value+1;
					skin.input_txt.text=slider.value.toString();
					split1.count=allNum-slider.value;
					split2.count=slider.value;
					break;
			}
		}
		
		private function  get splitNum():int
		{
			return slider.value;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner)
			iteminfo=data as ClientItemInfo;
			slider.addEventListener(Event.CHANGE,onChange);
			skin.input_txt.addEventListener(Event.CHANGE,onChangeNum);
		}
	}
}