package org.mokylin.skin.app.biaoju
{
	import feathers.controls.text.Fontter;
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
	public class BiaoJuLiShiJiLuSkin extends feathers.controls.StateSkin
	{
		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuLiShiJiLuSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__BiaoJuLiShiJiLuSkin_UIAsset1_i(),__BiaoJuLiShiJiLuSkin_UIAsset2_i(),__BiaoJuLiShiJiLuSkin_Label1_i(),__BiaoJuLiShiJiLuSkin_Label2_i(),__BiaoJuLiShiJiLuSkin_Label3_i(),list_i(),__BiaoJuLiShiJiLuSkin_UIAsset3_i(),__BiaoJuLiShiJiLuSkin_UIAsset4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuLiShiJiLuSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "时间";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 68;
			temp.y = 44;
			return temp;
		}

		private function __BiaoJuLiShiJiLuSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "事件";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 207;
			temp.y = 44;
			return temp;
		}

		private function __BiaoJuLiShiJiLuSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "金额";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 324;
			temp.y = 44;
			return temp;
		}

		private function __BiaoJuLiShiJiLuSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/li_shi_jl.png";
			temp.x = 173;
			temp.y = 15;
			return temp;
		}

		private function __BiaoJuLiShiJiLuSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/biao_ti_1.png";
			temp.x = -1;
			temp.y = 36;
			return temp;
		}

		private function __BiaoJuLiShiJiLuSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/hua_bian.png";
			temp.x = 44;
			temp.y = 25;
			return temp;
		}

		private function __BiaoJuLiShiJiLuSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/hua_bian_2.png";
			temp.x = 275;
			temp.y = 25;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 197;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 403;
			temp.x = 11;
			temp.y = 68;
			return temp;
		}

	}
}