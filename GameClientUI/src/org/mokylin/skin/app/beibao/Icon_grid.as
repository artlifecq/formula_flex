package org.mokylin.skin.app.beibao
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberZhuangbei_jie;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Icon_grid extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Num_jie:feathers.controls.UINumber;

		public var grid:feathers.controls.UIAsset;

		public var lock:feathers.controls.UIAsset;

		public var no_select:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Icon_grid()
		{
			super();
			
			this.currentState = "normal";
			this.height = 44;
			this.width = 44;
			this.elementsContent = [grid_i(),Num_jie_i(),no_select_i(),lock_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Num_jie_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_jie = temp;
			temp.name = "Num_jie";
			temp.height = 27;
			temp.label = "j";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberZhuangbei_jie;
			temp.width = 15;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/app/beibao/daojukuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lock = temp;
			temp.name = "lock";
			temp.styleName = "ui/common/tubiao/suo.png";
			temp.x = 31;
			temp.y = 28;
			return temp;
		}

		private function no_select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			no_select = temp;
			temp.name = "no_select";
			temp.styleName = "ui/common/tubiao/zhanyong.png";
			temp.x = 0;
			temp.y = 32;
			return temp;
		}

	}
}