package  com.rpgGame.appModule.xinfa
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.appModule.jingmai.sub.JinMaiAttrExt;
	import com.rpgGame.core.events.CheatsEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	
	import flash.geom.Point;
	
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Shuxin;
	
	public class XinFaAttrViewPanelExt extends SkinUI
	{
		public var _skin:Jingmai_Shuxin;
		//缓存下来减少运算量
		private var _totalCHash:HashMap=new HashMap();
		private var _totalJHash:HashMap=new HashMap();
		private var labArr:Array=[];
		private var pool:Array=[];
		private var _cxHash:HashMap;//值都是0
		private var _stoneHash:HashMap;
		public function XinFaAttrViewPanelExt()
		{
			_skin=new Jingmai_Shuxin();
			super(_skin);
			
			_cxHash=AttValueConfig.getAttrHash(120101);
			_stoneHash=AttValueConfig.getAttrHash(120102);
			
			Mgr.cheatsMgr.addEventListener(CheatsEvent.CHEATS_CHANGE,onCheatsChange);
			Mgr.cheatsMgr.addEventListener(CheatsEvent.CHEATS_NODE_CHANGE,onNodeChange);
			countAllAttr();
		}
		
		protected function onCheatsChange(event:CheatsEvent):void
		{
			// TODO Auto-generated method stub
			var data:CheatsVo=event.data;
			if (data) 
			{
				var tmpc:HashMap=_totalCHash.getValue(data.cheatsConfig.q_id);
				var tmpJ:HashMap=_totalJHash.getValue(data.cheatsConfig.q_id);
				if (!tmpc) 
				{
					return;
				}
				if (!tmpJ) 
				{
					return;
				}
				tmpc.clear();
				tmpJ.clear();
				calculateMeridianAttar(data.cheatsConfig.q_id,tmpc,tmpJ);
				updateAttr();
			}
		}
		private function countAllAttr():void
		{
			_totalCHash.clear();
			_totalJHash.clear();
			
			var keys:Array=Mgr.cheatsMgr.cheatsHash.keys();
			for each (var merId:int in keys) 
			{
				var tmpC:HashMap=new HashMap();
				var tmpJ:HashMap=new HashMap();
				calculateMeridianAttar(merId,tmpC,tmpJ);
				_totalCHash.put(merId,tmpC);
				_totalJHash.put(merId,tmpJ);
			}
			updateAttr();
		}
		protected function onNodeChange(event:CheatsEvent):void
		{
			// TODO Auto-generated method stub
			var data:CheatsNodeVo=event.data;
			if (data) 
			{
				var tmpc:HashMap=_totalCHash.getValue(data.cheatsId);
				var tmpJ:HashMap=_totalJHash.getValue(data.cheatsId);
				if (!tmpc) 
				{
					return;
				}
				if (!tmpJ) 
				{
					return;
				}
				tmpc.clear();
				tmpJ.clear();
				calculateMeridianAttar(data.cheatsId,tmpc,tmpJ);
				updateAttr();
			}
		}
		private function updateAttr():void
		{
			var tmpC:HashMap=new HashMap();
			var tmpJ:HashMap=new HashMap();
			var keys:Array=_totalCHash.keys();
			for each (var key:int in keys) 
			{
				MCUtil.mergeValueHashMap(tmpC,_totalCHash.getValue(key));
			}
			MCUtil.mergeValueHashMap(tmpC,_cxHash);
			//激活属性加到真气节点里面
			var cheats:Array=Mgr.cheatsMgr.cheatsHash.values();
			for each (var vo:CheatsVo in cheats) 
			{
				if (vo.level>0&&vo.extendAttr.size()>0) 
				{
					MCUtil.mergeValueHashMap(tmpC,vo.extendAttr);
				}
			}
			
			keys=_totalJHash.keys();
			for each (var key2:int in keys) 
			{
				MCUtil.mergeValueHashMap(tmpJ,_totalJHash.getValue(key2))
			}
			MCUtil.mergeValueHashMap(tmpJ,_stoneHash);
			for each (var lab:JinMaiAttrExt in labArr) 
			{
				MCUtil.removeSelf(lab);
			}
			pool=pool.concat(labArr);
			labArr.length=0;
			var startPos:Point=new Point(0,0);
			labArr=labArr.concat(AttrUtil.showAttrByItem(tmpC,this._skin.grpXueWei,JinMaiAttrExt,1,startPos,228,24+5,pool));
			startPos.y=0;
			labArr=labArr.concat(AttrUtil.showAttrByItem(tmpJ,this._skin.grpBianShi,JinMaiAttrExt,1,startPos,228,24+5,pool));
		}
	
		private function calculateMeridianAttar(meriId:int,hashC:HashMap,hashJ:HashMap):void
		{
			
			var serverData:Array=Mgr.cheatsMgr.getCheatVo(meriId).subNodeHash.values();
			if (serverData) 
			{
				
				for each (var acuInfo:CheatsNodeVo in serverData) 
				{
					//真气
					if (acuInfo.getNodeType()==0) 
					{
						if (acuInfo.curLevel>0&&acuInfo.getAttrIdAtLevel(acuInfo.curLevel)!=0) 
						{
							AttValueConfig.getTypeValue(acuInfo.getAttrIdAtLevel(acuInfo.curLevel),hashC);
						}
					}
					//砭石
					else if (acuInfo.getStone()!=null) 
					{
						var itemq:Q_item=ItemConfig.getQItemByID(acuInfo.getStone().itemModelId);
						if (itemq.q_att_type!=0) 
						{
							AttValueConfig.getTypeValue(itemq.q_att_type,hashJ);
						}
					}
				}	
			}
		}
		
	}
}