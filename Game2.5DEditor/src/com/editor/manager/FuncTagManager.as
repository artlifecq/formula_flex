package com.editor.manager
{
	import com.editor.data.FuncTagInfo;
	import com.editor.data.TabelData;

	/**
	 *
	 * 功能标签管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-26 上午11:03:17
	 *
	 */
	public class FuncTagManager
	{
		private static var _instance : FuncTagManager;

		public static function getInstance() : FuncTagManager
		{
			if (!_instance)
			{
				_instance = new FuncTagManager();
			}
			return _instance;
		}

		private var _currSelectedFuncTag : FuncTagInfo = null;
		public var currSelectedSubFuncTag : FuncTagInfo = null;

		public function FuncTagManager()
		{
		}

		public function getFuncTags() : Array
		{
			var infos : Array = [];
			var tabels : Array = DataStructuresManager.getInstance().getTabelList();
			tabels.sortOn(["order", "id"], Array.NUMERIC);
			for each (var tabel : TabelData in tabels)
			{
				var info : FuncTagInfo = new FuncTagInfo();
				info.featureType = tabel.mFeatureType;
				info.subFeatureType = tabel.mSubFeatureType;
				info.funcTag = tabel.mFuncTag;
				info.tabelName = tabel.name;
				var correlationTabels : Array = DataStructuresManager.getInstance().getCorrelationTabels(tabel);
				for each (var correlatTabel : TabelData in correlationTabels)
				{
					if (correlatTabel.isInternal)
						continue;
					var correlatInfo : FuncTagInfo = new FuncTagInfo();
					correlatInfo.featureType = correlatTabel.mFeatureType;
					correlatInfo.subFeatureType = correlatTabel.mSubFeatureType;
					correlatInfo.funcTag = correlatTabel.mFuncTag;
					correlatInfo.tabelName = correlatTabel.name;
					info.correlationFuncTags.push(correlatInfo);
				}
				infos.push(info);
			}
			return infos;
		}

		public function get currSelectedFuncTag() : FuncTagInfo
		{
			return _currSelectedFuncTag;
		}

		public function set currSelectedFuncTag(value : FuncTagInfo) : void
		{
			_currSelectedFuncTag = value;
			EditorCameraManager.updateProperty();
		}
	}
}
