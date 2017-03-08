package com.rpgGame.appModule.bag
{
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.BaseIcon;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import org.mokylin.skin.app.beibao.piliangshiyong;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
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
		
		private var _iconFace:IconCDFace;
		
		public function ItemBatchPanel()
		{
			_skin=new piliangshiyong();
			_iconFace=new IconCDFace(IcoSizeEnum.ICON_64);
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
		
			updateDisplay();
		}
		
		private function updateDisplay():void
		{
			_skin.lbl_name.color=ItemConfig.getItemQualityColor(clientItemInfo.cfgId);
			_skin.lbl_name.text=clientItemInfo.name;
			_skin.lbl_num.text="本组剩余:"+clientItemInfo.itemInfo.num;
			_iconFace.x=30;
			_iconFace.y=50;
			FaceUtil.SetItemGrid(_iconFace, clientItemInfo);
			_iconFace.setQualityImageIconPoint(6,4);
			_iconFace.selectImgVisible=false;
			_skin.container.addChild(_iconFace);
			_skin.lbl_currentNum.text=currentNum.toString();
			
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
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			
			switch (target) {
				case _skin.btn_min:
					currentNum--;
					currentNum=currentNum<1?1:currentNum;
					_skin.lbl_currentNum.text=currentNum.toString();
					break;
				case _skin.btn_max:
					currentNum++;
					currentNum=currentNum>clientItemInfo.itemInfo.num?clientItemInfo.itemInfo.num:currentNum;
					_skin.lbl_currentNum.text=currentNum.toString();
					break;
				case _skin.btn_ok:
					ItemUseManager.useItem(clientItemInfo,currentNum);
					this.hide();
					break;
			}
		}
	}
}