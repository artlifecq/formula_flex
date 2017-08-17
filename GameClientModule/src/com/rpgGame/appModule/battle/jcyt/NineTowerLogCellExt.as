package com.rpgGame.appModule.battle.jcyt
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.netData.yaota.bean.YaoTaInfo;
	
	import org.mokylin.skin.app.zhanchang.jiucengyaota.RiZi_Item;
	
	public class NineTowerLogCellExt extends SkinUI
	{
		private var _skin:RiZi_Item;
		
		public function NineTowerLogCellExt(index:int)
		{
			_skin=new RiZi_Item();
			super(_skin);
			_skin.bg1.visible=index%2==0;
			_skin.bg2.visible=!_skin.bg1.visible;
		}
		
		public function setData(data:YaoTaInfo):void
		{
			var rank:int=data.rank;
			var name:String=data.playerName;
			var lv:int=data.tier;
			var kill:int=data.killNumber;
			var score:int=data.integral;
			
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
			_skin.lbName.text=name;
			_skin.lbName.color=color;
			
			_skin.lbLevel.text=lv+"";
			_skin.lbLevel.color=color;
			
			_skin.lbKill.text=kill+"";
			_skin.lbKill.color=color;
			
			_skin.lbNum.text=score+"";
			_skin.lbNum.color=color;
		}
	}
}