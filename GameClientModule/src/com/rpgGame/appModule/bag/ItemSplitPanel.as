package com.rpgGame.appModule.bag
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.mokylin.skin.app.beibao.wupingchaifen;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
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
			
			split1.touchable=split2.touchable=targetIcon.touchable=false;
			
			targetIcon.x=70;
			split1.x=173;
			split2.x=229;
			targetIcon.y=split1.y=split2.y=52;
			skin.slider.value=1;
			skin.slider.addEventListener(Event.CHANGE,onChange);
			skin.slider.y+=10;
		}
		
		private function onChange(event:Event):void
		{
			skin.lbl_currentNum.text=skin.slider.value.toString();
			split1.count=allNum-skin.slider.value;
			split2.count=skin.slider.value;
		}
		
		private function getGrid():DragDropItem
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_48,GridBGType.GRID_SIZE_46);
			var grid:DragDropItem = render.getGrid();
			return grid;
		}
		
		public function set iteminfo(value:ClientItemInfo):void
		{
			_iteminfo = value;
			
			allNum=_iteminfo.itemInfo.num;
			targetIcon.setIconResName( ClientConfig.getItemIcon(_iteminfo.icoName, targetIcon. iconSize));
			split1.setIconResName( ClientConfig.getItemIcon(_iteminfo.icoName, split1. iconSize));
			split2.setIconResName( ClientConfig.getItemIcon(_iteminfo.icoName, split2. iconSize));
			targetIcon.count=allNum;
			
			targetIcon.alwayShowCount=split1.alwayShowCount=split2.alwayShowCount=true;
			
			skin.slider.minimum=1;
			skin.slider.maximum=_iteminfo.itemInfo.num;
			skin.slider.step=1;
			
			skin.slider.value=1;
			split1.count=allNum-skin.slider.value;
			split2.count=skin.slider.value;
			skin.lbl_currentNum.text=skin.slider.value.toString();
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
				case skin.btn_min:
					skin.slider.value=skin.slider.value-1;
					skin.lbl_currentNum.text=skin.slider.value.toString();
					split1.count=allNum-skin.slider.value;
					split2.count=skin.slider.value;
					break;
				case skin.btn_max:
					skin.slider.value=skin.slider.value+1;
					skin.lbl_currentNum.text=skin.slider.value.toString();
					split1.count=allNum-skin.slider.value;
					split2.count=skin.slider.value;
					break;
			}
		}
		
		private function  get splitNum():int
		{
			return skin.slider.value;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner)
			iteminfo=data as ClientItemInfo;
		}
	}
}