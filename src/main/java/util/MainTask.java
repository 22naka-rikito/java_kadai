package util;

public class MainTask {

	/**
	 * 文字列配列を数値配列に変換する。
	 */
	public static int[] toIntArray(String[] array) {
		// TODO: ここは自分で正しい処理に書き換える
//		String[] array01 = str01.split(",");
//		int[] testdata = { 5, 0, 9, 2, 4, 1, 8, 6, 7, 3 };
		int[] testdata = new int[array.length];
		for(int i = 0; i < array.length; i++) {
			if(!("".equals(array[0]))) {
				testdata[i] = Integer.parseInt(array[i]);
			}else {
				testdata = null;
			}
		}
		return testdata;
	}

	/**
	 * ヒープソートのアルゴリズムを用いて昇順に並べ替える。
	 */
	public static void heapSort(int[] array) {
		// TODO: 発展課題のメイン実装
//		array = null;
		if(array == null) {
			return;
		}
		int size =array.length;
		int[] array_tmp = new int[size];
		int i;
		int j;
		int tmp;
		int cnt = 0;
		
		while(cnt < size) {
			
			i = size - 1;
			do {
				if(i % 2 == 0) {
					if(array[i] > array[i - 1]) {
						tmp = array[i];
						array[i] = array[i - 1];
						array[i - 1] = tmp;
					}
				}else {
					i -= 1;
					continue;
				}
				i -= 2;
			}while(i >= 1);
			
			j = size - 1;
			do {
				if(j % 2 == 0) {
					j -= 1;
					continue;
				}else {
					if(array[j] > array[(j - 1) / 2]) {
						tmp = array[j];
						array[j] = array[(j - 1) / 2];
						array[(j - 1) / 2] = tmp;
					}
				}
				j -= 2;
			}while(j >= 1);
			array_tmp[cnt] = array[0];
			array[0] = 0;
			cnt++;
		}
		cnt = 0;
		while(cnt < size) {
			array[cnt] = array_tmp[cnt];
			cnt++;
		}
	}
	
}