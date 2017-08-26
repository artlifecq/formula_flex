package org.mokylin.skin.app.shejiao.zudui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Duiwu_Head extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbLevel:feathers.controls.Label;

		public var lbMap:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Duiwu_Head()
		{
			super();
			
			this.currentState = "normal";
			this.height = 26;
			this.width = 910;
			this.elementsContent = [__Duiwu_Head_Group1_i(),lbName_i(),lbLevel_i(),lbZhanli_i(),lbNum_i(),lbMap_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Duiwu_Head_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__Duiwu_Head_UIAsset1_i(),__Duiwu_Head_UIAsset2_i(),__Duiwu_Head_UIAsset3_i(),__Duiwu_Head_UIAsset4_i(),__Duiwu_Head_UIAsset5_i()];
			return temp;
		}

		private function __Duiwu_Head_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 234;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Duiwu_Head_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 140;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function __Duiwu_Head_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 250;
			temp.x = 374;
			temp.y = 0;
			return temp;
		}

		private function __Duiwu_Head_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 106;
			temp.x = 624;
			temp.y = 0;
			return temp;
		}

		private function __Duiwu_Head_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 180;
			temp.x = 730;
			temp.y = 0;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.text = "队长等级";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 84;
			temp.x = 261;
			temp.y = 4;
			return temp;
		}

		private function lbMap_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMap = temp;
			temp.name = "lbMap";
			temp.text = "所在地图";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 84;
			temp.x = 772;
			temp.y = 4;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "队长名称";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 84;
			temp.x = 82;
			temp.y = 4;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "人数";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 84;
			temp.x = 635;
			temp.y = 4;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "平均战力";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 84;
			temp.x = 451;
			temp.y = 4;
			return temp;
		}

	}
}