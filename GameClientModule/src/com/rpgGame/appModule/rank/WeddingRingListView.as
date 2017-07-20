package com.rpgGame.appModule.rank
{
	import com.rpgGame.coreData.enum.RankListType;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Jieshu;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip1_Skin;
	
	public class WeddingRingListView extends RankListViewBase
	{
		private var _skin:PaiHang_Jieshu;
		public function WeddingRingListView():void
		{
			_skin = new PaiHang_Jieshu();
			super(_skin, RankListType.WEDDINGRING_TYPE);
		}
		
		override protected function initstance():void
		{
			this._cellGroup = _skin.cellgroup;
			this.bindBtnAll(_skin.btnAll);
			this.bindPageBtn(_skin.skinFlip.skin as Flip1_Skin);
			this.bindRightGroup(_skin.skinRight);
			this._uiTongjizhong = _skin.uiTongjizhong;
			super.initstance();
		}
		
		override protected function bindRightGroup(content:SkinnableContainer):void
		{
			if(_rightGroup!=null)
				return ;
			_rightGroup = new WeddingRingRightGroup(content.skin as PaiHang_Right,_type);
		}
	}
}


import com.rpgGame.app.utils.FightValueUtil;
import com.rpgGame.appModule.rank.RightGroupBase;
import com.rpgGame.coreData.cfg.AttValueConfig;
import com.rpgGame.coreData.cfg.hunyin.JieHunJieZiData;
import com.rpgGame.coreData.clientConfig.Q_advance_wedding;
import com.rpgGame.coreData.clientConfig.Q_att_values;

import org.mokylin.skin.app.paihangbang.PaiHang_Right;

class WeddingRingRightGroup extends RightGroupBase
{
	public function WeddingRingRightGroup(skin:PaiHang_Right, type:int)
	{
		super(skin, type);
	}
	
	override protected function initData():void
	{
		super.initData();
		var qdata:Q_advance_wedding = JieHunJieZiData.getModByLv(_topInfo.param);
		if(qdata!=null)
		{
			var attValues1:Q_att_values=AttValueConfig.getAttInfoById(qdata.q_att_type);
			_power = FightValueUtil.calFightPowerByAttValue(attValues1,_topInfo.job);
		}else{
			_power = 0;
		}
	}
	
}