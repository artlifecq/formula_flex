package com.editor.operate
{
	import com.editor.data.ConfigDesc;
	import com.editor.data.FuncTagInfo;
	import com.editor.data.TabelData;
	import com.editor.enum.FeaturesType;
	import com.editor.manager.DataStructuresManager;
	import com.editor.manager.FuncTagManager;
	import com.editor.manager.SceneRoleManager;
	import com.editor.manager.TrailManager;

	import flash.geom.Vector3D;


	/**
	 *
	 * 轨迹编辑操作
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-20 上午11:03:17
	 *
	 */
	public class TrailEditOperate
	{
		public function TrailEditOperate()
		{
		}

		public static function clickPlusKey() : void
		{
			var currTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedFuncTag;
			var currSubTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedSubFuncTag;
			var mainTag : FuncTagInfo = null;
			if (currTag && currTag.featureType == FeaturesType.TRAIL_TYPE)
				mainTag = currTag;
			else if (currSubTag && currSubTag.subFeatureType == FeaturesType.TRAIL_TYPE)
				mainTag = currSubTag;
			if (!mainTag)
				return;

			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(mainTag.tabelName);
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			if (configDesc.selectedData)
			{
				var position : Vector3D = SceneRoleManager.getInstance().targetPos;
				if (TrailManager.getInstance().selectedFlag)
				{
					TrailManager.getInstance().setSelectedFlagPos(position);
				}
				else
				{
					TrailManager.getInstance().createTrailPoint(configDesc.selectedData, position);
				}
			}
		}

		public static function clickMinusKey() : void
		{
			var currTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedFuncTag;
			var currSubTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedSubFuncTag;
			var mainTag : FuncTagInfo = null;
			if (currTag && currTag.featureType == FeaturesType.TRAIL_TYPE)
				mainTag = currTag;
			else if (currSubTag && currSubTag.subFeatureType == FeaturesType.TRAIL_TYPE)
				mainTag = currSubTag;
			if (!mainTag)
				return;
			if (TrailManager.getInstance().selectedFlag)
			{
				TrailManager.getInstance().deleteTrailPoint(TrailManager.getInstance().selectedFlag);
			}
		}
	}
}
