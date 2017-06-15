package com.rpgGame.appModule.battle.jcyt
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	
	import org.mokylin.skin.app.zhanchang.jiucengyaota.JiFenPaiHang_Item;
	
	public class NineTowerScoreCellExt extends SkinUI
	{
		private var _skin:JiFenPaiHang_Item;
		
		public function NineTowerScoreCellExt()
		{
			_skin=new JiFenPaiHang_Item();
			super(_skin);
		
		}
		
		public function setData(data:*):void
		{
			var rank:int;
			var name:String;
			var score:int;
			
			if (rank<=3) 
			{
				_skin.grpNo.visible=true;
				_skin.lbNo.visible=false;
				_skin.numZhanli.label=rank+"";
			}
			else
			{
				_skin.grpNo.visible=false;
				_skin.lbNo.visible=true;
				_skin.lbNo.text=rank+"";
				_skin.lbNo.color=GameColorUtil.COLOR_NORMAL;
			}
			var color:uint=GameColorUtil.COLOR_NORMAL;
			if (rank==1) 
			{
				color=GameColorUtil.COLOR_RED;
			}
			else if (rank==2) 
			{
				color=GameColorUtil.COLOR_ORANGE;
			}
			else if (rank==3) 
			{
				color=GameColorUtil.COLOR_YELLOW;
			}		
			_skin.lbNum.text=score+"";
			_skin.lbNum.color=color;
		}
	}
}