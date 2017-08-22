package org.mokylin.skin.app.xinjineng
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
	public class XinJiNeng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var gGai:feathers.controls.Group;

		public var grpName:feathers.controls.Group;

		public var lbTime:feathers.controls.Label;

		public var uiKuang:feathers.controls.UIAsset;

		public var uiLeft:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiRight:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function XinJiNeng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 123;
			this.width = 518;
			this.elementsContent = [bg_i(),grpName_i(),gGai_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/xinjineng/bg.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function gGai_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gGai = temp;
			temp.name = "gGai";
			temp.x = 193;
			temp.y = 8;
			temp.elementsContent = [uiRight_i(),uiLeft_i()];
			return temp;
		}

		private function grpName_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpName = temp;
			temp.name = "grpName";
			temp.height = 123;
			temp.width = 374;
			temp.x = 72;
			temp.y = 0;
			temp.elementsContent = [uiKuang_i(),uiName_i(),lbTime_i()];
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "5秒后自动关闭";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 255;
			temp.y = 55;
			return temp;
		}

		private function uiKuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiKuang = temp;
			temp.name = "uiKuang";
			temp.styleName = "ui/app/xinjineng/gezi.png";
			temp.x = 130;
			temp.y = 0;
			return temp;
		}

		private function uiLeft_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLeft = temp;
			temp.name = "uiLeft";
			temp.styleName = "ui/app/xinjineng/yuanpan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/xinjineng/1001.png";
			temp.x = 0;
			temp.y = 43;
			return temp;
		}

		private function uiRight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiRight = temp;
			temp.name = "uiRight";
			temp.styleName = "ui/app/xinjineng/yuanpan2.png";
			temp.x = 68;
			temp.y = 0;
			return temp;
		}

	}
}