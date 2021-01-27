/**
 * 
 */

console.log("Reple Module........");

var repleService = (function() {

	function add(reple, callback, error) {
		console.log("add reple...............");

		$.ajax({
			type: 'post',
			url: '/reple/insert',
			data: JSON.stringify(reple),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	//	function getList(param, callback, error) {
	//
	//		var rId = param.rId;
	//		var page = param.page || 1;
	//
	//		$.getJSON("/replies/pages/" + rId + "/" + page + ".json",
	//				function(data) {
	//					if (callback) {
	//						callback(data);
	//					}
	//				}).fail(function(xhr, status, err) {
	//			if (error) {
	//				error();
	//			}
	//		});
	//	}



	function getList(param, callback, error) {

		var rId = param.rId;
		var page = param.page || 1;

		$.getJSON("/reple/pages/" + rId + "/" + page + ".json",
			function(data) {

				if (callback) {
					//callback(data); // 댓글 목록만 가져오는 경우 
					callback(data.repleCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
				}
			}).fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});
	}


	function remove(reId, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/reple/' + reId,
			success: function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function update(reple, callback, error) {

		console.log("reId: " + reple.reId);

		$.ajax({
			type: 'put',
			url: '/reple/' + reple.reId,
			data: JSON.stringify(reple),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function get(reId, callback, error) {

		$.get("/reple/" + reId + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd].join('');
		}
	}
	;

	return {
		add: add,
		get: get,
		getList: getList,
		remove: remove,
		update: update,
		displayTime: displayTime
	};

})();
