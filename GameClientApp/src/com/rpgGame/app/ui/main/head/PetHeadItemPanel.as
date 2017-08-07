package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import org.mokylin.skin.app.meiren.MeiRen_Select;
	
	public class PetHeadItemPanel extends SkinUI
	{
		private var _skin:MeiRen_Select;
		private var _itemList:Vector.<PetHeadItem>;
		public function PetHeadItemPanel()
		{
			_skin=new MeiRen_Select();
			super(_skin);
//			MCUtil.removeSelf(_skin.btnNext);
//			MCUtil.removeSelf(_skin.btnPrev);
		}
		
		override protected function onShow():void
		{
			super.onShow();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			if(_itemList!=null)
			{
				for(var i:int=0;i<_itemList.length;i++)
				{
					_skin.container.removeChild(_itemList[i]);
					MCUtil.removeSelf(_itemList[i]);
				}
				_itemList=null;
			}
		}
		
		public function SetData(list:Vector.<PetInfo>):void
		{
			var item:PetHeadItem;
			if(_itemList==null) _itemList = new Vector.<PetHeadItem>();
			for(var i:int=0;i<list.length;i++)
			{
				if(i<_itemList.length){
					item=_itemList[i];
				}else{
					item=new PetHeadItem();
					_skin.container.addChild(item);
					_itemList.push(item);
				}
				item.setData(list[i]);
				item.x=i%4*(item.width+15)+15;
				item.y=((int)(i/4))*item.height+4;	
			}
			this._skin.imgBG.width = item.x+item.width+4;
			this._skin.imgBG.height = item.y+item.height+4;
		}
	}
}