package com.rpgGame.appModule.jingmai.sub
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	
	public class MeridianMap extends SkinUI
	{
		//经脉图id
		private var meridianId:int;
		private var pointHash:HashMap;
		public function MeridianMap(skin:StateSkin,mid:int,configList:Array)
		{
			super(skin);
			this.meridianId=mid;
			configList.sort(sortData);
			try
			{
				pointHash=new HashMap();
				var len:int=configList.length;
				var tmpPoint:UIAsset;
				var tmpLine:UIAsset;
				var tmpLab:Label;
				var mp:MerdianPoint;
				var key:String;
				var tmpArr:Array;
				for (var i:int = 1; i <=len; i++) 
				{
					tmpPoint=_stateSkin["ico_"+i];
					tmpLine=_stateSkin["l_"+i];
					tmpLab=_stateSkin["lb_q"+i];
					mp=new MerdianPoint(tmpPoint,tmpLine,tmpLab,configList[i].q_meridian_id);
					tmpArr=configList[i].q_meridian_id.split("_");
					key=tmpArr[1]+"_"+tmpArr[2];
					pointHash.put(key,mp);
				}
			} 
			catch(error:Error) 
			{
				
			}
			this.pivotX=_stateSkin.width/2;
			this.pivotY=_stateSkin.height/2;
		}
		private static function sortData(qA:Q_meridian,qB:Q_meridian):int
		{
			var posA:int=int(qA.q_meridian_id.split("_")[1]);
			var posB:int=int(qB.q_meridian_id.split("_")[1]);
			if (posA<posB) 
			{
				return -1;
			}
			else if(posA>posB)
			{
				return 1;
			}
			return 0;
		}
	}
}