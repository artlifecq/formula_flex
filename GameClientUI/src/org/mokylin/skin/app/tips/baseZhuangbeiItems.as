package org.mokylin.skin.app.tips
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
	public class baseZhuangbeiItems extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;

		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function baseZhuangbeiItems()
		{
			super();
			
			this.currentState = "normal";
			this.height = 60;
			this.width = 191;
			this.elementsContent = [bg_i(),lbl_name_i(),Icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 60;
			temp.styleName = "ui/common/tips/tips_zhuangbei_bg.png";
			temp.width = 191;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.text = "装备名字";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 61;
			temp.y = 16;
			return temp;
		}

	}
}