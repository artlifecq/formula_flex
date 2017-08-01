package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_advance;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.pet.bean.PetInfo;
	
	import org.mokylin.skin.app.meiren.Tips_MeiRen;
	
	public class PetTip extends SkinUI implements ITip
	{
		private var _skin:Tips_MeiRen;
		
		private var _info:PetInfo;
		
		public function PetTip()
		{
			_skin = new Tips_MeiRen();
			super(_skin);
		}
		
		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_info=data as PetInfo;
			_skin.uiName.styleName = "ui/app/meiren/head_icon/name"+_info.modelId+"s.png";
			_skin.uiLevel.styleName = "ui/app/meiren/jieshu/"+_info.rank+".png";
			var qPetAdv:Q_girl_advance=PetAdvanceCfg.getPet(_info.modelId,_info.rank);
			var attrHash:HashMap=AttValueConfig.getAttrHash(qPetAdv.q_attid_self);
			if(attrHash!=null&&attrHash.keys()!=null)
			{
				var type:int=attrHash.keys()[0];
				_skin.lb_type.text = CharAttributeType.getCNName(type);
				_skin.lbl_gongj1.text=attrHash.getValue(type);
			}
			else
			{
				_skin.lb_type.visible=false;
				_skin.lbl_gongj1.visible=false;
			}
		}
		
		public function hideTips() : void
		{
			
		}
		
		private static var _instance : PetTip = null;
		
		public static function get instance() : PetTip
		{
			if (null == _instance)
			{
				_instance = new PetTip();
			}
			return _instance;
		}
	}
}