package com.rpgGame.appModule.bag
{
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.mokylin.skin.app.beibao.piliangshiyong;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;
	
	/**
	 *物品批量使用面板 
	 * @author dik
	 * 
	 */
	public class ItemBatchPanel extends SkinUIPanel
	{
		private var _skin:piliangshiyong;
		private var clientItemInfo:ClientItemInfo;
		
		private var currentNum:int;
		
		private var _iconFace:DragDropItem;
		
		public function ItemBatchPanel()
		{
			_skin=new piliangshiyong();
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_64,GridBGType.GRID_SIZE_64);
			_iconFace=render.getGrid();
			_iconFace.gridInfo=new GridInfo(0,0);
			_skin.input_txt.restrict="0-9";
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			CONFIG::netDebug {
				NetDebug.LOG("[AppModule] [ItemBatchPanel] show");
			}
			super.show(data, openTable, parentContiner);
			
			clientItemInfo=data as ClientItemInfo;
			currentNum=clientItemInfo.itemInfo.num;
			_skin.input_txt.addEventListener(Event.CHANGE,onChangeNum);
			updateDisplay();
		}
		
		override public function hide():void
		{
			super.hide();
			_skin.input_txt.removeEventListener(Event.CHANGE,onChangeNum);
		}
		
		private function updateDisplay():void
		{
			_skin.lbl_name.color=ItemConfig.getItemQualityColor(clientItemInfo.cfgId);
			_skin.lbl_name.text=clientItemInfo.name;
			_skin.lbl_num.text="本组剩余:"+clientItemInfo.itemInfo.num;
			_iconFace.x=30;
			_iconFace.y=50;
			FaceUtil.SetItemGrid(_iconFace, clientItemInfo);
			_iconFace.setQualityImageIconPoint(6,5);
			_iconFace.selectImgVisible=false;
			_skin.container.addChild(_iconFace);
			_skin.input_txt.text=currentNum.toString();
			if(clientItemInfo.binded){
				_skin.isLock.text="[已绑定]";
			}else{
				if(clientItemInfo.qItem.q_bind==0){
					_skin.isLock.visible=false;
				}else if(clientItemInfo.qItem.q_bind==1){
					_skin.isLock.visible="[获得时绑定]";
				}else{
					_skin.isLock.visible="[使用后绑定]";
				}
			}
		}
		
		private function onChangeNum(e:Event):void
		{
			currentNum=int(_skin.input_txt.text);
			currentNum=currentNum<=0?1:currentNum;
			currentNum=currentNum>=clientItemInfo.itemInfo.num?clientItemInfo.itemInfo.num:currentNum;
			_skin.input_txt.text=currentNum.toString();
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			
			switch (target) {
				case _skin.btn_min:
					currentNum--;
					currentNum=currentNum<1?1:currentNum;
					_skin.input_txt.text=currentNum.toString();
					break;
				case _skin.btn_max:
					currentNum++;
					currentNum=currentNum>clientItemInfo.itemInfo.num?clientItemInfo.itemInfo.num:currentNum;
					_skin.input_txt.text=currentNum.toString();
					break;
				case _skin.btn_ok:
					ItemUseManager.useItem(clientItemInfo,currentNum);
					this.hide();
					break;
			}
		}
	}
}