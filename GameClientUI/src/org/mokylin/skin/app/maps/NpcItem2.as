package org.mokylin.skin.app.maps
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.maps.SelectBtn;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class NpcItem2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_over:feathers.controls.Button;

		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function NpcItem2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 242;
			this.elementsContent = [__NpcItem2_UIAsset1_i(),lbl_name_i(),btn_over_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __NpcItem2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/titilebg/ItemBghei.png";
			temp.top = 0;
			return temp;
		}

		private function btn_over_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_over = temp;
			temp.name = "btn_over";
			temp.height = 25;
			temp.styleClass = org.mokylin.skin.app.maps.SelectBtn;
			temp.width = 242;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.text = "标签";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 236;
			temp.x = 3;
			temp.y = 3;
			return temp;
		}

	}
}