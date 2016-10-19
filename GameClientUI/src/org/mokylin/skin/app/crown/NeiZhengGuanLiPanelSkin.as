package org.mokylin.skin.app.crown
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class NeiZhengGuanLiPanelSkin extends feathers.controls.StateSkin
	{
		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function NeiZhengGuanLiPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__NeiZhengGuanLiPanelSkin_UIAsset1_i(),__NeiZhengGuanLiPanelSkin_UIAsset2_i(),__NeiZhengGuanLiPanelSkin_UIAsset3_i(),__NeiZhengGuanLiPanelSkin_Label1_i(),__NeiZhengGuanLiPanelSkin_Label2_i(),__NeiZhengGuanLiPanelSkin_Label3_i(),__NeiZhengGuanLiPanelSkin_Label4_i(),list_i(),__NeiZhengGuanLiPanelSkin_UIAsset4_i(),__NeiZhengGuanLiPanelSkin_UIAsset5_i(),__NeiZhengGuanLiPanelSkin_UIAsset6_i(),__NeiZhengGuanLiPanelSkin_UIAsset7_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __NeiZhengGuanLiPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "内政名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 149;
			temp.x = 231;
			temp.y = 22;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "可用状态";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 436;
			temp.y = 21;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "持续时长";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 601;
			temp.y = 22;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.color = 0xFFE258;
			temp.width = 57;
			temp.x = 772;
			temp.y = 23;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/neikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/di.png";
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiaodi.png";
			temp.x = 218;
			temp.y = 14;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 244;
			temp.y = 24;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 410;
			temp.y = 24;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 580;
			temp.y = 24;
			return temp;
		}

		private function __NeiZhengGuanLiPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/nei_zheng.jpg";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 432;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 653;
			temp.x = 222;
			temp.y = 51;
			return temp;
		}

	}
}