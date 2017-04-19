package com.rpgGame.appModule.jingmai.sub
{
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;

	public class MerdianPoint
	{
		private var imgPoint:UIAsset;
		private var linkLine:UIAsset;
		private var labAtt:Label;
		private var data:AcuPointInfo;
		private var meridianId:String;
		//0 锁定，1，空 2放置了
		private var state:int;
		public function MerdianPoint(point:UIAsset,line:UIAsset,lab:Label,merId:String)
		{
			this.imgPoint=point;
			this.linkLine=line;
			this.labAtt=lab;
			this.meridianId=merId;

		}
		public function setData(acp:AcuPointInfo):void
		{
			this.data=acp;
			//有数据说明开启了的
			if (data) 
			{
				this.meridianId=data.MeridId+"_"+data.acuPointId+"_"+data.level;
				if (data.stone.length>0) 
				{
					setState(2);
				}
				else
				{
					setState(1);
				}
			}
			//就是锁定
			else
			{
				setState(0);
			}
		}
		private function setState(sta:int):void
		{
			this.state=sta;
			
		}
	}
}