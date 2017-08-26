package  com.rpgGame.app.ui.alert
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.utils.UIUtil;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import flash.utils.getTimer;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.beibao.piliangshiyong;
	
	import starling.display.DisplayObject;
	
	/**
	 *物品批量使用面板 
	 * @author dik
	 * 
	 */
	public class ItemNoticePanel extends SkinUIPanel
	{
		private var _skin:piliangshiyong;
		private var clientItemInfo:ClientItemInfo;
		
		private var currentNum:int;
		
		private var _iconFace:IconCDFace;
		private var numCtrl:NumSelectUICtrl;
		
		private static var BLACK_TIME:int=3*60*1000;
		private static var blackHash:HashMap=new HashMap();
		private static var pool:Array=[];
		private static var _showHash:HashMap=new HashMap();
		public static function checkInBlack(itemId:long):Boolean
		{
			var time:int=blackHash.getValue(itemId.hexValue);
			if (time==0) 
			{
				return false;
			}
			if (getTimer()-time<BLACK_TIME) 
			{
				return true;
			}
			blackHash.remove(itemId.hexValue);
			return false;
		}
		public function ItemNoticePanel()
		{
			_skin=new piliangshiyong();
			//_skin.input_txt.restrict="0-9";
			super(_skin);
//			_skin.lbl_title.text="获得新物品";
			numCtrl=new NumSelectUICtrl(_skin.btn_max,_skin.btn_min,_skin.btn_all,null,_skin.lbBuyNum,1,1,dataChange);
		}
		
		public static function  show(item:ClientItemInfo):void 
		{
			var panel:ItemNoticePanel=_showHash.getValue(item.itemInfo.itemId.hexValue);
			if (!panel) 
			{
				if (pool.length>0) 
				{
					panel=pool.pop();
				}
				else
				{
					panel=new ItemNoticePanel();
				}
				StarlingLayerManager.appUILayer.addChild(panel);
				UIUtil.alignToStageRightBottom(panel);
				_showHash.put(item.itemInfo.itemId.hexValue,panel);
			}
			panel.setData(item);
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			UIUtil.alignToStageRightBottom(this);
		}
		 private function setData(item:ClientItemInfo):void
		 {
			 clientItemInfo=item;
			 currentNum=clientItemInfo.itemInfo.num;
			 numCtrl.updateMax(currentNum,currentNum);
			 numCtrl.maxValue();
			 //_skin.input_txt.addEventListener(Event.CHANGE,onChangeNum);
			 updateDisplay();
		 }
		
		private function dataChange(val:int):void
		{
			this.currentNum=val;
		}
		private function updateDisplay():void
		{
			_skin.lbl_name.color=ItemConfig.getItemQualityColor(clientItemInfo.cfgId);
			_skin.lbl_name.text=clientItemInfo.name;
			_skin.lbl_num.text="本组剩余:"+clientItemInfo.itemInfo.num;
			FaceUtil.SetItemGrid(_iconFace, clientItemInfo);
			_iconFace.setIconPoint(6,5);
			_iconFace.selectImgVisible=false;
			//_skin.input_txt.text=currentNum.toString();
			if(clientItemInfo.binded){
				_skin.isLock.text="[已绑定]";
				_skin.isLock.visible=true;
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
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			
			
			switch (target) 
			{
				case _skin.btnClose:
					blackHash.put(clientItemInfo.itemInfo.itemId.hexValue,getTimer());
					break;
				case _skin.btn_ok:
					ItemUseManager.useItem(clientItemInfo,currentNum);
					MCUtil.removeSelf(this);
					break;
			}
			super.onTouchTarget(target);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			_iconFace=IconCDFace.create(IcoSizeEnum.ICON_64);
			_iconFace.x=30;
			_iconFace.y=50;
			_skin.container.addChild(_iconFace);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			_showHash.remove(clientItemInfo.itemInfo.itemId.hexValue);
			_iconFace.destroy();
			clientItemInfo=null;
			currentNum=0;
			pool.push(this);
		}
	}
}