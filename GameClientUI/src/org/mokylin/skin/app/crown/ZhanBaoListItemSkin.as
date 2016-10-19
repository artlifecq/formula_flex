package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhanBaoListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var label:feathers.controls.Label;

		public var select:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanBaoListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 365;
			this.elementsContent = [__ZhanBaoListItemSkin_UIAsset1_i(),select_i(),label_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhanBaoListItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 365;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function label_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			label = temp;
			temp.name = "label";
			temp.height = 25;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 365;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			select = temp;
			temp.name = "select";
			temp.height = 25;
			temp.styleName = "ui/common/kang/xuanzhong/xuanzhong.png";
			temp.width = 365;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}