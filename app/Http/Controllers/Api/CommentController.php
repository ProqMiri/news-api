<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CommentRequest;
use App\Models\Comment;

/**
 * Class CommentController
 * @package App\Http\Controllers\Api
 */

class CommentController extends Controller
{
    /**
     *
     * Store a comment for pot by post id
     *
     * @param \App\Http\Requests\CommentRequest $commentRequest
     * @param int $postId
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(CommentRequest $commentRequest, int $postId):\Illuminate\Http\JsonResponse {
        $comment = new Comment();
        $comment->comment = $commentRequest->comment;
        $comment->author_name = $commentRequest->author_name;
        $comment->post_id = $postId;
        $comment->save();
        return response()->json([
            'success' => [
                'message' => 'Successfully!'
            ]
        ]);
    }
}
