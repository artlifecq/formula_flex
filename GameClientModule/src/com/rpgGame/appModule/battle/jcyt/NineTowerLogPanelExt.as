package com.rpgGame.appModule.battle.jcyt
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.PageSelectUICtrl;
	import com.rpgGame.core.events.NineTowerEvent;
	import com.rpgGame.netData.yaota.bean.YaoTaInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jiucengyaota.ZhanChangRiZi_Skin;
	import org.mokylin.skin.common.Flip3_Skin;
	
	public class NineTowerLogPanelExt extends SkinUIPanel
	{
		private var _skin:ZhanChangRiZi_Skin;
		private var _numCtrl:PageSelectUICtrl;
		private var _cellList:Vector.<NineTowerLogCellExt>;
		private const PAGE_NUM:int=10;
		public function NineTowerLogPanelExt()
		{
			_skin=new ZhanChangRiZi_Skin();
			super(_skin);
			
			var skinF:Flip3_Skin=_skin.skinFlip.skin as Flip3_Skin;
			_numCtrl=new PageSelectUICtrl(skinF.btnAdd,skinF.btnDec,skinF.textDisplay,onPageChange,"{0}",skinF.btnMax,skinF.btnMin);
			
			
			_cellList=new Vector.<NineTowerLogCellExt>();
			var tmp:NineTowerLogCellExt;
			for (var i:int = 0; i < PAGE_NUM; i++) 
			{
				tmp=new NineTowerLogCellExt(i);
				tmp.x=13;
				tmp.y=70+i*tmp.height;
				_cellList.push(tmp);
				this.addChild(tmp);
				tmp.visible=false;
			}
		}
		
		private function onPageChange(arr:Array):void
		{
			// TODO Auto Generated method stub
			var len:int=arr.length;
			var cell:NineTowerLogCellExt;
			for (var i:int = 0; i < PAGE_NUM; i++) 
			{
				cell=_cellList[i];
				if (i<len) 
				{
					cell.visible=true;
					cell.setData(arr[i]);
				}
				else
				{
					cell.visible=false;
				}
			}
		}
		private function setPageData(...arg):void
		{
			var list:Vector.<YaoTaInfo>=arg[0];
			var data:Array=[];
			var len:int=list.length;
			for (var i:int = 0; i < len; i++) 
			{
				data.push(list[i]);
			}
			
			_numCtrl.setData(data,PAGE_NUM);
			_skin.uiNo.visible=data.length==0;
			_skin.skinFlip.visible=data.length>0;
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(NineTowerEvent.GET_LOG_DATA,setPageData);
			Mgr.nineTowerMgr.reqTowerLog();
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(NineTowerEvent.GET_LOG_DATA,setPageData);
		}
	}
}