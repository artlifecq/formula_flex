package org.mokylin.skin.app.beibao.Xinfa
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
	public class Shuoming_Tips extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuoming_Tips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 138;
			this.width = 431;
			this.elementsContent = [__Shuoming_Tips_UIAsset1_i(),__Shuoming_Tips_Label1_i(),__Shuoming_Tips_Label2_i(),__Shuoming_Tips_Label3_i(),__Shuoming_Tips_Label4_i(),__Shuoming_Tips_Label5_i(),__Shuoming_Tips_Label6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Shuoming_Tips_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1.心法是提升属性的主要途径之一";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 10;
			return temp;
		}

		private function __Shuoming_Tips_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "2.心法来源于：任务奖励、副本掉落的残卷合成等";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 30;
			return temp;
		}

		private function __Shuoming_Tips_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "3.心法激活时其附带技能也将激活";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 50;
			return temp;
		}

		private function __Shuoming_Tips_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "4.每本心法都有相生组合，获得相生关系的心法后可获得额外属性";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 70;
			return temp;
		}

		private function __Shuoming_Tips_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "5.每多收集一本心法还将获得心法收集的属性奖励";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 90;
			return temp;
		}

		private function __Shuoming_Tips_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "6.砭石可通过砭石合成来获得更高级的砭石";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 110;
			return temp;
		}

		private function __Shuoming_Tips_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 138;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 431;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}